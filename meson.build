project('mutter-vapi-gen', 'vala', 'c',
       meson_version: '>=0.59.1')

vapi_dir = join_paths(meson.current_source_dir(), 'vapi')

add_project_arguments([
#        '--target-glib=2.44',
        '--hide-internal',
        '--enable-deprecated',
        '--vapidir=' + vapi_dir,
    ],
    language: 'vala',
)

vala = meson.get_compiler('vala')
vapi_dir = meson.current_source_dir() / 'vapi'

mutter_dep = []
libmutter_dep = []

vala_flags = []

# ----------------------------------------------------------------------

mutter41_dep = dependency('libmutter-9', version: ['>= 41', '< 42'], required: false)
if mutter41_dep.found()
	libmutter_dep = dependency('libmutter-9', version: '>= 41')
	mutter_dep = [
		libmutter_dep,
		dependency('mutter-cogl-9'), dependency('mutter-cogl-pango-9'),
		dependency('mutter-clutter-9')
	]
	vala_flags = ['--define', 'HAS_MUTTER338', '--define', 'HAS_MUTTER40', '--define', 'HAS_MUTTER41']
endif

mutter42_dep = dependency('libmutter-10', version: ['>= 42', '< 43'], required: false)
if mutter41_dep.found()
	libmutter_dep = dependency('libmutter-10', version: '>= 42')
	mutter_dep = [
		libmutter_dep,
		dependency('mutter-cogl-10'), dependency('mutter-cogl-pango-10'),
		dependency('mutter-clutter-10')
	]
	vala_flags = ['--define', 'HAS_MUTTER338', '--define', 'HAS_MUTTER40', '--define', 'HAS_MUTTER41',
		      '--define', 'HAS_MUTTER42'
		     ]
endif

mutter43_dep = dependency('libmutter-11', version: ['>= 42', '< 43'], required: false)
if mutter43_dep.found()
	libmutter_dep = dependency('libmutter-11', version: '>= 42')
	mutter_dep = [
		libmutter_dep,
		dependency('mutter-cogl-11'), dependency('mutter-cogl-pango-11'),
		dependency('mutter-clutter-11')
	]
	vala_flags = ['--define', 'HAS_MUTTER338', '--define', 'HAS_MUTTER40', '--define', 'HAS_MUTTER41',
		      '--define', 'HAS_MUTTER42'
		     ]
endif

# ----------------------------------------------------------------------

if mutter_dep.length() == 0
    error ('No supported mutter library found!')
endif

mutter_typelib_dir = libmutter_dep.get_variable(pkgconfig: 'typelibdir')

add_project_arguments(vala_flags, language: 'vala')
add_project_link_arguments(['-Wl,-rpath,@0@'.format(mutter_typelib_dir)], language: 'c')

# ----------------------------------------------------------------------

vapigen = find_program('vapigen', required: false)
if vapigen.found()
    subdir('vapi')
endif

# ----------------------------------------------------------------------

# libmutter_target is the custom target for vapi/libmutter-10.vapi
#
# libmutter_deps_file_symlink_target is the symlinked
# vapi/libmutter-10.deps file.
#
# manually call
#  ninja -C build vapi/libmutter-10.vapi
#  ninja -C build vapi/libmutter-10.deps

add_project_arguments([
        '--vapidir=' + meson.current_build_dir() + '/vapi'
    ],
    language: 'vala')

# ----------------------------------------------------------------------


# DEPS: [ 'Atk' 'Graphene' 'GLib' 'Pango' 'Cairo' 'GDesktop' 'Gtk'
# 'Posix' 'X' ]

posix_dep = vala.find_library('posix')
base_dep_names = [ 'gtk+-3.0',  'gnome-desktop-3.0', 'graphene-1.0' ]
base_deps = []

foreach i :base_dep_names
  base_deps += dependency(i)
endforeach

subdir('gala-min')
