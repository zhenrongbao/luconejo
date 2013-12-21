assert(require 'luconejo')
local connected_test = assert(require 'test.connected_test')

describe("declare_exchange_defaults",function()
	local this = connected_test.create()

	it("should work",function()
		assert.True( this.channel:SimpleDeclareExchange("declare_defaults") )
		assert.True( this.channel:DeleteExchange("declare_defaults") )
	end)
end)

describe("declare_exchange_direct",function()
	local this = connected_test.create()

	it("",function()
		assert.True( this.channel:DeclareExchange("declare_direct", luconejo.Channel.EXCHANGE_TYPE_DIRECT, false, false, false) )
		assert.True( this.channel:DeleteExchange("declare_direct") )
    end)
end)

describe("declare_exchange_fanout",function()
	local this = connected_test.create()
	
	it("",function()
	    assert.True( this.channel:DeclareExchange("declare_fanout", luconejo.Channel.EXCHANGE_TYPE_FANOUT, false, false, false) )
	    assert.True( this.channel:DeleteExchange("declare_fanout") )
    end)
end)

describe("declare_exchange_topic",function()
	local this = connected_test.create()
	
	it("",function()
	    assert.True( this.channel:DeclareExchange("declare_topic", luconejo.Channel.EXCHANGE_TYPE_TOPIC, false, false, false) )
	    assert.True( this.channel:DeleteExchange("declare_topic") )
    end)
end)

describe("declare_exchange_passive_good",function()
	local this = connected_test.create()
    
    it("",function()
	    assert.True( this.channel:DeclareExchange("declare_passive", luconejo.Channel.EXCHANGE_TYPE_DIRECT, false, false, false) )
	    assert.True( this.channel:DeclareExchange("declare_passive", luconejo.Channel.EXCHANGE_TYPE_DIRECT, true, false, false) )

	    assert.True( this.channel:DeleteExchange("declare_passive") )
    end)
end)

describe("declare_exchange_passive_notexist",function()
	local this = connected_test.create()
    
    it("",function()
	    assert.False( this.channel:DeclareExchange("declare_passive_notexist", luconejo.Channel.EXCHANGE_TYPE_DIRECT, true, false, false) )
    end)
end)

-- describe("declare_exchange_typemismatch",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("declare_typemismatch", luconejo.Channel.EXCHANGE_TYPE_DIRECT)
--     EXPECT_THROW(this.channel:DeclareExchange("declare_typemismatch", luconejo.Channel.EXCHANGE_TYPE_FANOUT), ChannelException)

--     this.channel:DeleteExchange("declare_typemismatch")
--     end)
-- end)

-- describe("declare_exchange_typemismatch2",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("declare_typemismatch", luconejo.Channel.EXCHANGE_TYPE_DIRECT)
--     EXPECT_THROW(this.channel:DeclareExchange("declare_typemismatch", luconejo.Channel.EXCHANGE_TYPE_DIRECT, false, true), ChannelException)

--     this.channel:DeleteExchange("declare_typemismatch")
--     end)
-- end)

-- describe("declare_exchange_durable",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("declare_durable", luconejo.Channel.EXCHANGE_TYPE_DIRECT, false, true)

--     this.channel:DeleteExchange("declare_durable")
--     end)
-- end)

-- describe("declare_exchange_autodelete",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("declare_autodelete", luconejo.Channel.EXCHANGE_TYPE_DIRECT, false, false, true)

--     this.channel:DeleteExchange("declare_autodelete")
--     end)
-- end)

-- describe("delete_exchange",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("delete_exchange")
--     this.channel:DeleteExchange("delete_exchange")
--     end)
-- end)

-- describe("delete_exchange_notexist",function()
-- 		local this = connected_test.create()
--     it("",function()
--     EXPECT_THROW(this.channel:DeleteExchange("exchange_notexist"), ChannelException)
--     end)
-- end)

-- describe("delete_exhange_ifunused",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("exchange_used", luconejo.Channel.EXCHANGE_TYPE_DIRECT)

--     this.channel:DeleteExchange("exchange_used", true)
--     end)
-- end)

-- describe("delete_exhange_ifused",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("exchange_used", luconejo.Channel.EXCHANGE_TYPE_DIRECT)
--     std::string queue = this.channel:DeclareQueue("")
--     this.channel:BindQueue(queue, "exchange_used", "whatever")

--     EXPECT_THROW(this.channel:DeleteExchange("exchange_used", true), ChannelException)

--     this.channel:DeleteQueue(queue)
--     this.channel:DeleteExchange("exchange_used")
--     end)
-- end)

-- describe("bind_exchange",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("exchange_bind_dest")
--     this.channel:DeclareExchange("exchange_bind_src")

--     this.channel:BindExchange("exchange_bind_dest", "exchange_bind_src", "rk")

--     this.channel:DeleteExchange("exchange_bind_dest")
--     this.channel:DeleteExchange("exchange_bind_src")
--     end)
-- end)

-- describe("bind_exchange_badexchange",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("exchange_bind_dest")

--     EXPECT_THROW(this.channel:BindExchange("exchange_bind_dest", "exchange_bind_notexist", "rk"), ChannelException)

--     this.channel:DeleteExchange("exchange_bind_dest")
--     end)
-- end)

-- describe("unbind_exchange",function()
-- 		local this = connected_test.create()
--     it("",function()
--     this.channel:DeclareExchange("exchange_bind_dest")
--     this.channel:DeclareExchange("exchange_bind_src")

--     this.channel:BindExchange("exchange_bind_dest", "exchange_bind_src", "rk")
--     this.channel:UnbindExchange("exchange_bind_dest", "exchange_bind_src", "rk")

--     this.channel:DeleteExchange("exchange_bind_dest")
--     this.channel:DeleteExchange("exchange_bind_src")
--     end)
-- end)

-- describe("unbind_exchange_badbinding",function()
-- 		local this = connected_test.create()
--     it("",function()
--     EXPECT_THROW(this.channel:UnbindExchange("exchange_notexist", "exchange_notexist", "notexist"), ChannelException)
--     end)
-- end)