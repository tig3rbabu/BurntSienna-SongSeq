use_bpm 240

in_thread do
  live_loop :bass do
    with_fx :gverb, room: 60, release: 4, mix: 0.2, amp: 0.65 do
      tick
      synth :dsaw, note: ring(57,52,54,55).look-24, attack: 0, sustain: ring(3,5).look*2, release: 0, amp: 4, detune: 0.3, cutoff: 70
      synth :fm, note: ring(57,52,54,55).look-12, attack: 0, sustain: ring(3,5).look*2, release: 0, amp: 2, depth: 3, cutoff: 90
      sleep ring(6,10).look
    end
  end
end

in_thread do
  live_loop :synth do
    with_fx :gverb, room: 70, release: 8, mix: 0.2, amp: 1 do
      with_fx :echo, phase: 0.5*2, decay: 4, mix: 0.7 do
        with_fx :slicer, phase: 0.5*1, wave: 1, pulse_width: 0.25, mix: 1 do
          e = synth :supersaw, note: 57+24+2, note_slide: 3, attack: 32, sustain: 0,  release: 36, amp: 2, cutoff: 110
          sleep 64
        end
      end
    end
  end
end

in_thread do
  live_loop :synth34 do
    with_fx :gverb, room: 70, release: 4, mix: 0.4, amp: 1 do
      with_fx :distortion, distort: 0.9, mix: 1 do
        with_fx :slicer, phase: 1.5*1, wave: 0, pulse_width: 0.666, smooth_down: 0, mix: 1 do
          a = 12*1
          t = synth :dsaw, note: 57-a, note_slide: 1, detune: 7, sustain: 16, release: 0, amp: 1, cutoff: 110
          4.times do
            tick
            control t, note: ring(57,64,60,62,64,60,62,57).look-a
            sleep ring(3,3,3,7).look
          end
        end
      end
    end
  end
end

in_thread do
  live_loop :beat4 do
    tick_reset
    with_fx :level, amp: 0.8 do
      with_fx :echo, phase: 0.5*2, decay: 4, mix: 0.5 do
        a = 4
        sample :bd_haus, amp: 7, cutoff: 100
        sleep 1*a
        with_fx :gverb, room: 50, tail_level: 0.9, release: 3, mix: 0.8, damp: 0 do
          sample :tabla_tas1, amp: 5, cutoff: 110, rate: 2.2
        end
        sleep 0.75*a
        2.times do
          with_fx :echo, phase: ring(nil,0.55).tick, decay: 1, mix: ring(0,1).look do
            sample :bd_haus, amp: 7, cutoff: 100
          end
          sleep ring(0.5,0.75).look*a
        end
        with_fx :gverb, room: 50, tail_level: 0.9, release: 3, mix: 0.8, damp: 0 do
          sample :elec_pop, amp: 2, cutoff: 110, rate: 2.2
          
        end
        sleep 1*a
        ##| stop
      end
    end
  end
end
