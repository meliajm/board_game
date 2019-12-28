RSpec.describe BoardGame do
  it "has a version number" do
    expect(BoardGame::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
