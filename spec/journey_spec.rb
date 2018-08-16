require "journey"

describe Journey do
  it "allows user to see the entry station" do
    subject.entry_s = "Moorgate"
    expect(subject.entry_s).to eq "Moorgate"
  end

  it "allows user to see the entry station" do
    subject.exit_s = "Moorgate"
    expect(subject.exit_s).to eq "Moorgate"
  end


  
end
