# Use this song data for your tests
songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

describe Song do
  it "has a name" do
    song = Song.new(songs[0])
    expect(song.name).to eq(songs[0])
  end
end

describe Jukebox do
  let(:jukebox) {Jukebox.new(songs)}

  it 'tell you if it is on' do 
    expect(jukebox.on?).to eq(true)
  end

  it 'can give help menu' do
    expect(jukebox.help).to eq("Please select help, list, exit, or play.")
  end

  it 'can exit out' do
    jukebox.exit
    expect(jukebox.on?).to eq(false)
  end

  it "can list" do
    expect(jukebox.command("list")).to eq(jukebox.list)
  end

  it 'can play' do
    jukebox.play(songs[4])
    expect(jukebox.command("play #{songs[4]}")).to eq("now playing (Far From) Home - Tiga")
  end

  it "can handle invalid command" do
    expect(jukebox.command('dkjsl')).to eq("invalid command")
  end 
end
