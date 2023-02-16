require 'sampple/commands/scanner'

RSpec.describe Sampple::Commands::Scanner do
  it "executes `scanner` command successfully" do
    output = StringIO.new
    ip = nil
    ports = nil
    options = {}
    command = Sampple::Commands::Scanner.new(ip, ports, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
