RSpec.describe "`sampple scanner` command", type: :cli do
  it "executes `sampple help scanner` command successfully" do
    output = `sampple help scanner`
    expected_output = <<-OUT
Usage:
  sampple scanner IP PORTS...

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
