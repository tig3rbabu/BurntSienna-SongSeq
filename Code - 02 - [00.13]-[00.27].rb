use_bpm 140

live_loop :bass do
  with_fx :gverb, room: 30, release: 4, mix: 0.4, amp: 0.45 do
    with_fx :slicer, phase: 0.5, wave: 0, mix: 0 do
      with_fx :distortion, distort: 0.8, mix: 1 do
        l = 4
        ##| synth :dsaw, note: ring(65,68,63,63).tick(:ii)-36, sustain: 8, release: 0, detune: 0.3, amp: 6, cutoff: 125
        8.times do
          tick(:i)
          notle = ring(72,70,69,65,65,65,72,74,75,74,72,68,68,68,69,70,72,70,69,65,65,65,65,nil,63,65,nil,nil,nil,nil,nil,nil).look(:i)
          synth :fm, note: notle-24, release: knit(0.35*l,25,3,1,0.35*l,6).look(:i), depth: 5, amp: 3
          synth :dsaw, note: notle-36, release: knit(0.35*l,25,3,1,0.35*l,6).look(:i), detune: 0.3, amp: 9, cutoff: 105, env_curve: 7
          sleep ring(0.75,0.75,0.75,0.25,0.5,0.5,0.25,0.25).look(:i)*2
        end
      end
    end
  end
end

live_loop :beat do
  tick
  sample :bd_haus, amp: 4, cutoff: 85 if (spread 6,16).look
  ##| sample :sn_dub, amp: ring(0,0,3,0).look, cutoff: 120
  sleep 0.5
end

live_loop :shimmy do
  with_fx :gverb, room: 60, release: 4, mix: 0.4 do
    with_fx :slicer, phase: 0.25*8, wave: 1, pulse_width: 0.25, phase_offset: 0.5, mix: 1 do
      ##| 4.times do
      ##| tick
      ##| synth :zawa, note: ring(72,70,69,65,65,65,72,74,75,74,72,68,74,65,72,70).look+0, sustain: 8, release: 0, detune: 0.3, amp: 0.2
      ##| end
      sleep 8
    end
  end
end

in_thread do
  live_loop :beatbot2 do
    sleep 1
    4.times do
      tick
      with_fx :gverb, room: 50, mix: 0.7 do
        with_fx :echo, phase: 0.5, decay: 4, mix: 0 do
          synth :cnoise, release: rrand(0.15,0.25), amp: 1.1, env_curve: 3, res: 0.33, cutoff: rrand(110,115)
          ##| synth :dsaw, note: ring(65,68,63,63).tick(:ii)-0, sustain: 0, release: 0.2, detune: 0.2, amp: 2, cutoff: 125
        end
        sleep ring(0.75,0.75,1,1).look*2
      end
    end
  end
end
