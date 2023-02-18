project (
    'virgil',  'vala', 'c' ,
    version: '1.0.0',
)

# Compilers
valac = meson.get_compiler ('vala')
cc = meson.get_compiler ('c')


valac_arguments = []

operating_system = build_machine.system ()
if operating_system == 'windows' or operating_system == 'cygwin'
    valac_arguments += '--define=VIRGIL_PLATFORM_WINDOWS'
elif operating_system == 'linux'
    valac_arguments += '--define=VIRGIL_PLATFORM_LINUX'
elif
    valac_arguments += '--define=VIRGIL_PLATFORM_UNKNOWN'
endif

add_project_arguments (valac_arguments, language: 'vala')


dependencies = [
    dependency ('gobject-2.0'),
    dependency ('gmodule-2.0'), # Will include GLIB
    valac.find_library ('raylib', dirs:   meson.current_source_dir () / 'vapi'),
    cc.find_library ('m'),
    cc.find_library ('raylib')
]


add_project_arguments(['--color=always','--enable-experimental', ], language: 'vala')

sources = [
    # PUBLIC API
    'src/Input/KeyCode.vala',
    'src/Input/MouseButton.vala',
    'src/Input/KeyboardInput.vala',
    'src/Input/MouseInput.vala',

    'src/Graphics/Shader.vala',
    'src/Graphics/ShaderDataType.vala',
    'src/Graphics/Font.vala',

    'src/GameObject.vala',
    'src/Component.vala',
    'src/Vector2.vala',
    'src/Rectangle.vala',
    'src/Colour.vala',
    'src/Transform.vala',
    'src/Texture2D.vala',
    'src/RenderTexture.vala',
    'src/Shapes.vala',
    'src/Surface2D.vala',
    'src/Game.vala',

    # PUBLIC COMPONENTS
    'src/Camera2D.vala',
    'src/TextureRenderer.vala',
    'src/Collider2D.vala',
    'src/CircleCollider2D.vala',
    'src/RectangleCollider2D.vala',

    # RUNTIME API
    'src/Runtime/Window.vala',
    'src/Runtime/GameLoader.vala',
    'src/Runtime/Main.vala',
    
]

 executable = executable('virgil',
    sources,
    dependencies: dependencies,
    export_dynamic: true,
    install : true,
    install_dir : meson.current_source_dir ()
  )


game_sources = [
    'sandbox/Game.vala',
    'sandbox/Player.vala',
    'sandbox/Box.vala'
]


game = shared_library('game',
    game_sources,
    dependencies: dependencies,
    link_with: executable,
    name_prefix: '',
    install : true,
    install_dir : meson.current_source_dir ()
)

