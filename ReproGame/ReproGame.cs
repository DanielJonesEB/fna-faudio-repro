using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;

namespace ReproGame
{
    class ReproGame : Game
    {
        private AudioEngine audioEngine;
        private SoundBank soundBank;
        private WaveBank waveBank;
        private Cue a;
        private Cue b;
        private int frames = 0;

        protected override void Initialize()
        {
            base.Initialize();
            audioEngine = new AudioEngine("Content/audio/Clover XACT.xgs");
            waveBank = new WaveBank(audioEngine, "Content/audio/Wave Bank.xwb");
            soundBank = new SoundBank(audioEngine, "Content/audio/Sound Bank.xsb");
            a = soundBank.GetCue("Indoor Theme 2");
            b = soundBank.GetCue("Sanha Theme");
        }

        protected override void Update(GameTime gameTime)
        {
            base.Update(gameTime);
            audioEngine.Update();

            if(! (a.IsPlaying || b.IsPlaying))
            {
                a.Play();
                a.Pause();
                b.Play();
                if(a.IsStopped)
                {
                    throw new Exception("a.IsStopped was true after pausing it and playing another cue");
                }
                else
                {
                    Console.Out.WriteLine("a.IsStopped was false after pausing it and playing another cue, so presumably this bug is fixed :)");
                }
            }

            if(frames > 0 && a.IsStopping)
            {
                throw new Exception("a.IsStopping is true, even after updating the audio engine");
            }

            frames++;
        }
    }
}

