use_bpm 140

live_loop :boomboompow do
  with_fx :lpf, cutoff: 60, cutoff_slide: 36, mix: 0 do |t|
    control t, cutoff: 120
    with_fx :wobble, phase: 48, invert_wave: 0, mix: 1 do
      ##| synth :cnoise, attack: 48, release: 0, amp: 0.5
    end
    12.times do
      with_fx :gverb, room: 60, release: 1, mix: 0.2 do
        with_fx :slicer, phase: 0.25*3, wave: 0, pulse_width: 0.666, mix: 1 do
          tick(:ii)
          ##| synth :dsaw, note: ring(56,54,54,52,52,54,54,52,54,52,49,49).look(:ii)-12, amp: 2, sustain: 4, release: 0, detune: 0.3
          synth :fm, note: ring(56,54,54,52,52,54,54,52,54,52,49,49).look(:ii)-12, amp: 2, sustain: 4, release: 0, depth: 3
          synth :dpulse, note: ring(56,54,54,52,52,54,54,52,54,52,49,49).look(:ii)-12, amp: 2, detune: 16, sustain: 4, cutoff: 85
        end
      end
      with_fx :gverb, room: 60, release: 5, mix: 0.3 do
        with_fx :lpf, cutoff: 125, amp: 1.5 do
          with_fx :echo, phase: 0.75, decay: 12*1, mix: 0.4 do
            8.times do
              tick(:i)
              ##| synth :dsaw, note: 56+0 , amp: 1.5, release: 0.25*1 if spread(5,32).look(:i)
              ##| synth :dsaw, note: ring(54).choose+12, amp: 1, release: 0.25*1 if spread(6,32, rotate: 2).look(:i)
              ##| synth :dsaw, note: ring(47,49).choose+24, amp: 1, release: 0.25, detune: 0.3 if spread(3,32).look(:i)
              sleep 0.5
            end
          end
        end
      end
    end
  end
end

in_thread do
  live_loop :tickas do
    with_fx :reverb, room: 0.3, mix: 0.4, amp: 0.3 do
      8.times do
        ##| synth :cnoise, release: rrand(0.15,0.25), amp: 3, env_curve: 3, res: 0.33, cutoff: rrand(105,115)
        ##| synth :gnoise, release: rrand(0.15,0.25), amp: 3, env_curve: 2, res: 0.43, cutoff: rrand(105,115)
        ##| synth :pnoise, release: rrand(0.15,0.25), amp: 4, env_curve: 2, res: 0.63, cutoff: rrand(105,115)
        sleep 0.25*1
      end
    end
  end
end

live_loop :beatles do
  8.times do
    sample :bd_haus, amp: 6*1 if spread(6,16).tick
    sample :elec_hi_snare, amp: knit(0,2,6,1,0,1).look, finish: 0.5, rate: 0.9
    sleep 0.5
  end
end

