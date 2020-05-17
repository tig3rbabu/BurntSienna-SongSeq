use_bpm 100

transposee = 4

live_loop :synth do
  with_fx :gverb, room: 60, mix: 0.1 do
    with_fx :slicer, phase: 0.25, wave: 0 do
      a = choose([0.75,0.5])
      tick
      ##| synth :dpulse, note: knit(:e2,3,:b2,3,:a2,3,:d2+12,3).look-12-transposee, sustain: 0.75, release: 1, amp: 4, detune: 12, cutoff: 110
      synth :fm, note: knit(:e2+12,3,:b2,3,:a2,3,:d2+12,3).look-transposee+0, sustain: a, release: 0, amp: 5, depth: 2
    end
    sleep ring(0.75,0.75,0.5).look
    synth :sine, note: :b3-transposee, sustain: 0.25, release: 0, amp: 4
    sleep ring(0.75,0.75,0.5).look
  end
end

in_thread do
  use_synth :zawa
  live_loop :rhythm do
    with_fx :gverb, room: 25, mix: 0.5, amp: 0 do
      ##| tick
      3.times do
        play ring(:fs3,:b3,:ds4,:fs3,:a3,:d4,:e3,:a3,:cs4,:fs3,:a3,:cs4).tick-transposee+0, sustain: 4, amp: 0.5, range: 15, cutoff: 75
      end
      sleep 4
    end
  end
end

in_thread do
  live_loop :synthy do
    with_fx :gverb, room: 50, mix: 0.2 do
      with_fx :echo, phase: 0.75, decay: 4, mix: 1 do
        with_fx :slicer, phase: 0.25*2, pulse_width: 0.25, wave: 0 do
          se = synth :dsaw, note: :b3+0-transposee, attack: 20, sustain: 7, release: 10, amp: 0.5
          sleep 32
        end
      end
    end
  end
end
