vapigen_args = [
	'--directory=@0@'.format(meson.current_build_dir()),
	'--metadatadir=@0@'.format(meson.current_source_dir()),
	'--girdir=@0@'.format(mutter_typelib_dir),
	'--vapidir=@0@'.format(meson.current_build_dir()),
	'--vapidir=@0@'.format(meson.current_source_dir()),
]

if mutter41_dep.found()
	cogl_target = custom_target('mutter-cogl-9',
		command: [
			vapigen,
			mutter_typelib_dir / 'Cogl-9.gir',
			'--library=mutter-cogl-9',
			'--pkg=gobject-2.0',
			'--pkg=cairo',
			'--pkg=graphene-gobject-1.0',
			vapigen_args,
#			files('Cogl-9-custom.vala')
		],
		output: 'mutter-cogl-9.vapi'
	)

	cogl_pango_target = custom_target('mutter-cogl-pango-9',
		command: [
			vapigen,
			mutter_typelib_dir / 'CoglPango-9.gir',
			'--library=mutter-cogl-pango-9',
			'--pkg=mutter-cogl-9',
			'--pkg=pangocairo',
			vapigen_args
		],
		depends: cogl_target,
		output: 'mutter-cogl-pango-9.vapi'
	)

	clutter_target = custom_target('mutter-clutter-9',
		command: [
			vapigen,
			mutter_typelib_dir / 'Clutter-9.gir',
			'--library=mutter-clutter-9',
			'--pkg=graphene-gobject-1.0',
			'--pkg=mutter-cogl-9',
			'--pkg=mutter-cogl-pango-9',
			'--pkg=atk',
			'--pkg=gio-2.0',
			'--pkg=json-glib-1.0',
			'--pkg=pangocairo',
			vapigen_args,
#			files('Clutter-9-custom.vala')
		],
		depends: [ cogl_target, cogl_pango_target ],
		output: 'mutter-clutter-9.vapi'
	)

	libmutter_target = custom_target('libmutter-9',
		command: [
			vapigen,
			mutter_typelib_dir / 'Meta-9.gir',
			'--library=libmutter-9',
			'--pkg=graphene-gobject-1.0',
			'--pkg=mutter-cogl-9',
			'--pkg=mutter-cogl-pango-9',
			'--pkg=mutter-clutter-9',
			'--pkg=atk',
			'--pkg=gio-2.0',
			'--pkg=json-glib-1.0',
			'--pkg=pangocairo',
			'--pkg=gtk+-3.0',
			'--pkg=x11',
			'--pkg=xfixes-4.0',
			vapigen_args
		],
		depends: [ cogl_target, cogl_pango_target, clutter_target ],
		output: 'libmutter-9.vapi'
	)
endif

# ----------------------------------------------------------------------

if mutter42_dep.found()
	cogl_target = custom_target('mutter-cogl-10',
		command: [
			vapigen,
			mutter_typelib_dir / 'Cogl-10.gir',
			'--library=mutter-cogl-10',
			'--pkg=gobject-2.0',
			'--pkg=cairo',
			'--pkg=graphene-gobject-1.0',
			vapigen_args,
#			files('Cogl-9-custom.vala')
		],
		output: 'mutter-cogl-10.vapi'
	)

	cogl_pango_target = custom_target('mutter-cogl-pango-10',
		command: [
			vapigen,
			mutter_typelib_dir / 'CoglPango-10.gir',
			'--library=mutter-cogl-pango-10',
			'--pkg=mutter-cogl-10',
			'--pkg=pangocairo',
			vapigen_args
		],
		depends: cogl_target,
		output: 'mutter-cogl-pango-10.vapi'
	)

	clutter_target = custom_target('mutter-clutter-10',
		command: [
			vapigen,
			mutter_typelib_dir / 'Clutter-10.gir',
			'--library=mutter-clutter-10',
			'--pkg=graphene-gobject-1.0',
			'--pkg=mutter-cogl-10',
			'--pkg=mutter-cogl-pango-10',
			'--pkg=atk',
			'--pkg=gio-2.0',
			'--pkg=json-glib-1.0',
			'--pkg=pangocairo',
			vapigen_args,
#			files('Clutter-10-custom.vala')
		],
		depends: [ cogl_target, cogl_pango_target ],
		output: 'mutter-clutter-10.vapi'
	)

	libmutter_target = custom_target('libmutter-10',
		command: [
			vapigen,
			mutter_typelib_dir / 'Meta-10.gir',
			'--library=libmutter-10',
			'--pkg=graphene-gobject-1.0',
			'--pkg=mutter-cogl-10',
			'--pkg=mutter-cogl-pango-10',
			'--pkg=mutter-clutter-10',
			'--pkg=atk',
			'--pkg=gio-2.0',
			'--pkg=json-glib-1.0',
			'--pkg=pangocairo',
			'--pkg=gtk+-3.0',
			'--pkg=x11',
			'--pkg=xfixes-4.0',
			vapigen_args
		],
		depends: [ cogl_target, cogl_pango_target, clutter_target ],
		output: 'libmutter-10.vapi'
	)

# ----------------------------------------------------------------------

libmutter10_deps_file_symlink_target = \
  custom_target('libmutter-10-deps-file-symlink-target',
		command: [
		  'ln',  '-sv',
		  meson.current_source_dir() + '/libmutter.deps',
		  meson.current_build_dir() + '/libmutter-10.deps'
		],
		output: [
		  'libmutter-10.deps'
		])

endif

# ----------------------------------------------------------------------

if mutter43_dep.found()
	cogl_target = custom_target('mutter-cogl-12',
		command: [
			vapigen,
			mutter_typelib_dir / 'Cogl-12.gir',
			'--library=mutter-cogl-12',
			'--pkg=gobject-2.0',
			'--pkg=cairo',
			'--pkg=graphene-gobject-1.0',
			vapigen_args,
#			files('Cogl-12-custom.vala')
		],
		output: 'mutter-cogl-12.vapi'
	)

	cogl_pango_target = custom_target('mutter-cogl-pango-12',
		command: [
			vapigen,
			mutter_typelib_dir / 'CoglPango-12.gir',
			'--library=mutter-cogl-pango-12',
			'--pkg=mutter-cogl-12',
			'--pkg=pangocairo',
			vapigen_args
		],
		depends: cogl_target,
		output: 'mutter-cogl-pango-12.vapi'
	)

	clutter_target = custom_target('mutter-clutter-12',
		command: [
			vapigen,
			mutter_typelib_dir / 'Clutter-12.gir',
			'--library=mutter-clutter-12',
			'--pkg=graphene-gobject-1.0',
			'--pkg=mutter-cogl-12',
			'--pkg=mutter-cogl-pango-12',
			'--pkg=atk',
			'--pkg=gio-2.0',
			'--pkg=json-glib-1.0',
			'--pkg=pangocairo',
			vapigen_args,
#			files('Clutter-12-custom.vala')
		],
		depends: [ cogl_target, cogl_pango_target ],
		output: 'mutter-clutter-12.vapi'
	)

	libmutter_target = custom_target('libmutter-12',
		command: [
			vapigen,
			mutter_typelib_dir / 'Meta-12.gir',
			'--library=libmutter-12',
			'--pkg=graphene-gobject-1.0',
			'--pkg=mutter-cogl-12',
			'--pkg=mutter-cogl-pango-12',
			'--pkg=mutter-clutter-12',
			'--pkg=atk',
			'--pkg=gio-2.0',
			'--pkg=json-glib-1.0',
			'--pkg=pangocairo',
			'--pkg=gtk+-3.0',
			'--pkg=x11',
			'--pkg=xfixes-4.0',
			vapigen_args
		],
		depends: [ cogl_target, cogl_pango_target, clutter_target ],
		output: 'libmutter-12.vapi'
	)

# ----------------------------------------------------------------------

libmutter12_deps_file_symlink_target = \
  custom_target('libmutter-12-deps-file-symlink-target',
		command: [
		  'ln',  '-sv',
		  meson.current_source_dir() + '/libmutter.deps',
		  meson.current_build_dir() + '/libmutter-12.deps'
		],
		output: [
		  'libmutter-12.deps'
		])
endif