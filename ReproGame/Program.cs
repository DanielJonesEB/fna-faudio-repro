using System;
using Microsoft.Xna.Framework;

namespace ReproGame {
    static class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            using (Game g = new ReproGame())
            {
                new GraphicsDeviceManager(g);
                g.Run();
            }
        }
    }
}
