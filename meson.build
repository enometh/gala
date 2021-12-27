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
