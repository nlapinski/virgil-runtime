using Raylib;

namespace Virgil.Runtime {
    internal static int main (string[] args) {
        set_trace_log_level (Raylib.TraceLogLevel.ALL);
        //  set_target_fps (60);

        Window window = new Window ("Virgil Runtime", 640, 360);

        GameLoader current_game = new GameLoader ();

        string game_prefix = "";

        // NOTE: not final, might be worth using OptionEntry
        for (int i = 0; i < args.length; i++) {
            if (args[i] == "--test-build") game_prefix = "build/";
        }

        try {
#if VIRGIL_PLATFORM_WINDOWS // TODO: Need to work out something cleaner and global
            current_game.register (game_prefix + "game.dll");
#else
            current_game.register (game_prefix + "game.so");
#endif
        } catch (GameRegisterError e) {
            warning ("%s\n", e.message);
        }

        current_game.load_content ();

        while (!window.should_close () || Game.should_close) {
            current_game.run (get_frame_time ());

            window.clear ();

            current_game.draw ();

            window.present ();
        }

        current_game.unload_content ();

        window.close ();

        return 0;
    }
}
