using MIDI

cd(@__DIR__)

@testset "MIDI IO" begin
    midi = load("doxy.mid")
    @test midi.tpq == 960
    @test length(midi.tracks) == 4

    notes = getnotes(midi, 4)

    @test length(notes) == 533
    @test notes.tpq == 960

    @test notes[1].pitch == 65
    @test notes[1].velocity == 69
    @test notes[1].position == 7427
    @test notes[1].duration == 181
    @test notes[1].channel == 0

    @test notes[2].pitch == 70
    @test notes[2].velocity == 85
    @test notes[2].position == 7760
    @test notes[2].duration == 450
    @test notes[2].channel == 0

end

@testset "Deprecated MIDI IO" begin
    midi = load("doxy.mid")
    @test_deprecated readMIDIFile("doxy.mid")
    @test_deprecated writeMIDIFile("test.mid", midi)
    @test_deprecated writeMIDIFile("test.midi", getnotes(midi))
    rm("test.mid")
    rm("test.midi")
end
