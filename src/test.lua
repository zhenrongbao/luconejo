assert(require 'luconejo')

print('luconejo version : ' .. luconejo.version)
print('SimpleAmqpClient version : ' .. luconejo.client_version)
print('amqp version : ' .. luconejo.amqp_version())

describe("library is loaded correctly", function()
  assert.are.equal( type(luconejo) , "table" )
end)
