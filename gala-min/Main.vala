// -*- Mode: vala; indent-tabs-mode:nil; -*-
//
//  Copyright 2011 Red Hat, Inc.
//  Copyright (C) 2012 Tom Beckmann, Rico Tzschichholz
//  Copyright (C) 2022 Madhu <enometh.net.meer>
//
// GalaMin adapted Gala/src/Main.vala and mutter.c for libmutter-10
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//


namespace GalaMin {
    static char *plugin_name = "libdefault";

    const OptionEntry[] OPTIONS = {
        { "version", 0, OptionFlags.NO_ARG, OptionArg.CALLBACK,
          (void*) print_version, "Print version", null },
        { "mutter-plugin", 0, OptionFlags.NONE, OptionArg.STRING,
          ref plugin_name, "Mutter plugin to use", "PLUGIN" },
        { null }
    };

    void print_version () {
        stdout.printf ("GalaMin %s\n", "42.alpha"); // Config.VERSION
        Meta.exit (Meta.ExitCode.SUCCESS);
    }


	void init_signal_handlers(Meta.Context ctx) {
        Posix.sigset_t empty_mask;
        Posix.sigemptyset (out empty_mask);
        Posix.sigaction_t act = {};
        act.sa_handler = Posix.SIG_IGN;
        act.sa_mask = empty_mask;
        act.sa_flags = 0;

        if (Posix.sigaction (Posix.SIGPIPE, act, null) < 0) {
            warning ("Failed to register SIGPIPE handler: %s", GLib.strerror (GLib.errno));
        }

        if (Posix.sigaction (Posix.SIGXFSZ, act, null) < 0) {
            warning ("Failed to register SIGXFSZ handler: %s", GLib.strerror (GLib.errno));
        }

        GLib.Unix.signal_add (Posix.SIGTERM, () => {
            ctx.terminate ();
            return GLib.Source.REMOVE;
        });
	}

    public static int main (string[] args) {
		var ctx = new Meta.Context ("Mutter(GalaMin)");

		init_signal_handlers(ctx);

		ctx.add_option_entries(OPTIONS, null);

        try {
            string[] args1 = args;
            ctx.configure (ref args1);
        } catch (Error e) {
            stderr.printf ("Failed to configure: %s\n", e.message);
            return Posix.EXIT_FAILURE;
        }

		ctx.set_plugin_name ((string) plugin_name);

        try {
            ctx.setup ();
        } catch (Error e) {
            stderr.printf ("Failed to setup: %s\n", e.message);
            return Posix.EXIT_FAILURE;
        }


        try {
            ctx.start ();
        } catch (Error e) {
            stderr.printf ("Failed to start: %s\n", e.message);
            return Posix.EXIT_FAILURE;
        }

		ctx.notify_ready ();

        try {
            ctx.run_main_loop ();
        } catch (Error e) {
            stderr.printf ("GalaMin terminated with a failure: %s\n", e.message);
            return Posix.EXIT_FAILURE;
        }

        return Posix.EXIT_SUCCESS;
    }
}
