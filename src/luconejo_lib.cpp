/**
 * Copyright (c) 2013 Dmitry Ledentsov
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

#include "luconejo_lib.h"

#include <LuaBridge.h>
#include <RefCountedPtr.h>
#include <string>
#include <cstdio>
#include <iostream>
#include <stdexcept>
#include <amqp.h>
#include <SimpleAmqpClient/SimpleAmqpClient.h>

#define xstr(s) str(s)
#define str(s) #s

namespace luconejo {



	namespace wrappers {


		static std::string EXCHANGE_TYPE_DIRECT() { return AmqpClient::Channel::EXCHANGE_TYPE_DIRECT; }
		static std::string EXCHANGE_TYPE_FANOUT() { return AmqpClient::Channel::EXCHANGE_TYPE_FANOUT; }
		static std::string EXCHANGE_TYPE_TOPIC() { return AmqpClient::Channel::EXCHANGE_TYPE_TOPIC; }
		static std::string INVALID_QUEUE_NAME() { return ""; }
		static std::string INVALID_CONSUMER_TAG() { return ""; }


		////////////////////////////////////
		bool Error(std::string const& err) {
			std::cerr << "luconejo exception: " << err << std::endl;
			return false;
		}

		///////////////////
		struct BasicMessage
		{
			AmqpClient::BasicMessage::ptr_t message;

			static RefCountedPtr<BasicMessage> Create(std::string const& body) {
				RefCountedPtr<BasicMessage> res(new BasicMessage);
				res->message = AmqpClient::BasicMessage::Create(body);
				return res;
			}

			bool Valid() const {
				return message;
			}

			std::string Body() const {
				if (!Valid())
					return "";

				return message->Body();
			}
		};

		struct Envelope {
			AmqpClient::Envelope::ptr_t envelope;

			bool Valid() const {
				return envelope;
			}

			RefCountedPtr<BasicMessage> Message() const {
				RefCountedPtr<BasicMessage> res(new BasicMessage);
				if (!Valid())
					return res;

				res->message = envelope->Message();
				return res;
			}

			std::string ConsumerTag() const {
				if (!Valid())
					return INVALID_CONSUMER_TAG();

				return envelope->ConsumerTag();
			}
		};

		////////////////
		struct Channel {
			AmqpClient::Channel::ptr_t connection;

			static RefCountedPtr<Channel> Create(
					std::string const& host) {
				RefCountedPtr<Channel> res(new Channel);
				try {
					res->connection = AmqpClient::Channel::Create(host);
				} catch (std::exception const& e) {
					Error(e.what());
				}
				return res;
			}

			static RefCountedPtr<Channel> CreateWithParameters(
					std::string const& host,
					int port,
					std::string const& user,
					std::string const& password,
					std::string const& vhost,
					int frame_max
					) {
				RefCountedPtr<Channel> res(new Channel);
				try {
					res->connection = AmqpClient::Channel::Create(host,port,user,password,vhost,frame_max);
				} catch (std::exception const& e) {
					Error(e.what());
				}
				return res;
			}

			static RefCountedPtr<Channel> CreateFromUri(
					std::string const& host_uri) {
				RefCountedPtr<Channel> res(new Channel);
				try {
					res->connection = AmqpClient::Channel::CreateFromUri(host_uri);
				} catch (std::exception const& e) {
					Error(e.what());
				}
				return res;
			}

			bool Disconnect() {
				if (!Valid())
					return false;

				connection.reset();
				return true;
			}

			bool Valid() const {
				return connection;
			}

			bool DeclareExchange(const std::string &exchange_name,
		                         const std::string &exchange_type,
		                         bool passive = false,
		                         bool durable = false,
		                         bool auto_delete = false) {
				if (!Valid())
					return false;

				try {
					connection->DeclareExchange(exchange_name,exchange_type,passive,durable,auto_delete);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			bool DeleteExchange(const std::string &exchange_name) {
				if (!Valid())
					return false;

				try {
					connection->DeleteExchange(exchange_name,false);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			bool DeleteExchangeIfUnused(const std::string &exchange_name) {
				if (!Valid())
					return false;

				try {
					connection->DeleteExchange(exchange_name,true);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			bool BindExchange(	std::string const& destination,
								std::string const& source,
								std::string const& routing_key) {
				if (!Valid())
					return false;

				try {
					connection->BindExchange(destination, source, routing_key);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			bool UnbindExchange(	std::string const& destination,
									std::string const& source,
									std::string const& routing_key) {
				if (!Valid())
					return false;

				try {
					connection->UnbindExchange(destination, source, routing_key);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			std::string DeclareQueue(	std::string const& queue_name,
										bool passive = false,
										bool durable = false,
										bool exclusive = true,
										bool auto_delete = true) {
				if (!Valid())
					return INVALID_QUEUE_NAME();

				try {
					return connection->DeclareQueue(queue_name,passive,durable,exclusive,auto_delete);
				} catch (std::exception const& e) {
					Error(e.what());
					return INVALID_QUEUE_NAME();
				}
			}

			std::string SimpleDeclareQueue( std::string const& queue_name ) {
				return DeclareQueue(queue_name);
			}

			bool DeleteQueue(	std::string const& queue_name,
								bool if_unused = false,
								bool if_empty = false) {
				if (!Valid())
					return false;

				try {
					connection->DeleteQueue(queue_name,if_unused,if_empty);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			bool BindQueue(	std::string const& queue_name,
							std::string const& exchange_name,
							std::string const& routing_key = "") {
				if (Valid())
					return false;

				try {
					connection->BindQueue(queue_name,exchange_name,routing_key);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			bool UnbindQueue(	std::string const& queue_name,
								std::string const& exchange_name,
								std::string const& routing_key = "") {
				if (Valid())
					return false;

				try {
					connection->UnbindQueue(queue_name,exchange_name,routing_key);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			bool PurgeQueue(std::string const& queue_name) {
				if (Valid())
					return false;

				try {
					connection->PurgeQueue(queue_name);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

			std::string BasicConsume(std::string const& queue,
		                      std::string const& consumer_tag = "",
		                      bool no_local = true,
		                      bool no_ack = true,
		                      bool exclusive = true,
		                      int prefetch_count = 1) {
				if (!Valid())
					return INVALID_CONSUMER_TAG();

				try {
					return connection->BasicConsume(queue,consumer_tag,no_local,no_ack,exclusive,static_cast<boost::uint16_t>(prefetch_count));
				} catch (std::exception const& e) {
					Error(e.what());
					return INVALID_CONSUMER_TAG();
				}
			}

			std::string SimpleBasicConsume(std::string const& queue) {
				return BasicConsume(queue);
			}

			RefCountedPtr<Envelope> BasicConsumeMessage(std::string const & consumer_tag, int timeout = -1) {
				RefCountedPtr<Envelope> res;

				if (!Valid())
					return res;

				AmqpClient::Envelope::ptr_t envelope;
				if (connection->BasicConsumeMessage(consumer_tag,envelope,timeout)) {
					res = RefCountedPtr<Envelope>(new Envelope);
					res->envelope = envelope;
				}

				return res;
			}

			bool BasicPublish(std::string const& exchange_name,
		                      std::string const& routing_key,
		                      RefCountedPtr<BasicMessage> message,
		                      bool mandatory = false,
		                      bool immediate = false) {
				if (!Valid() || !message.get() || !message->Valid())
					return false;

				try {
					connection->BasicPublish(exchange_name,routing_key,message->message,mandatory,immediate);
					return true;
				} catch (std::exception const& e) {
					return Error(e.what());
				}
			}

		};

	}
}

namespace luconejo {

	static const char* luconejo_version = "0.0.1";
	static const char* luconejo_SimpleAmqpClient_version = xstr(SIMPLEAMQPCLIENT_VERSION_MAJOR)"."xstr(SIMPLEAMQPCLIENT_VERSION_MINOR)"."xstr(SIMPLEAMQPCLIENT_VERSION_PATCH);

void register_luconejo (lua_State* L) {
	luabridge::getGlobalNamespace(L)
		.beginNamespace("luconejo")

			// global constants
			.addVariable("version",&luconejo_version,false)
			.addVariable("client_version",&luconejo_SimpleAmqpClient_version,false)
			.addFunction("amqp_version",&amqp_version)
		
			// Channel
			.beginClass<wrappers::BasicMessage>("BasicMessage")
				// factories
				.addStaticFunction("Create",wrappers::BasicMessage::Create)

				// class
				.addProperty("Valid",&wrappers::BasicMessage::Valid)
				.addProperty("Body",&wrappers::BasicMessage::Body)
			.endClass()

			// Envelope
			.beginClass<wrappers::Envelope>("Envelope")
				// class
				.addProperty("Valid",&wrappers::Envelope::Valid)
				.addProperty("Message",&wrappers::Envelope::Message)
				.addProperty("ConsumerTag",&wrappers::Envelope::ConsumerTag)
			.endClass()

			// Channel
			.beginClass<wrappers::Channel>("Channel")
				// constants
				.addStaticProperty("EXCHANGE_TYPE_DIRECT",&wrappers::EXCHANGE_TYPE_DIRECT)
				.addStaticProperty("EXCHANGE_TYPE_FANOUT",&wrappers::EXCHANGE_TYPE_FANOUT)
				.addStaticProperty("EXCHANGE_TYPE_TOPIC",&wrappers::EXCHANGE_TYPE_TOPIC)
				.addStaticProperty("INVALID_QUEUE_NAME",&wrappers::INVALID_QUEUE_NAME)
				.addStaticProperty("INVALID_CONSUMER_TAG",&wrappers::INVALID_CONSUMER_TAG)
		
				// factories
				.addStaticFunction("Create",wrappers::Channel::Create)
				.addStaticFunction("CreateWithParameters",wrappers::Channel::CreateWithParameters)
				.addStaticFunction("CreateFromUri",wrappers::Channel::CreateFromUri)
		
				// class
				.addProperty("Valid",&wrappers::Channel::Valid)
				.addFunction("Disconnect",&wrappers::Channel::Disconnect)
				.addFunction("DeclareExchange",&wrappers::Channel::DeclareExchange)
				.addFunction("DeleteExchange",&wrappers::Channel::DeleteExchange)
				.addFunction("DeleteExchangeIfUnused",&wrappers::Channel::DeleteExchangeIfUnused)
				.addFunction("BindExchange",&wrappers::Channel::BindExchange)
				.addFunction("UnbindExchange",&wrappers::Channel::UnbindExchange)
				.addFunction("SimpleDeclareQueue",&wrappers::Channel::SimpleDeclareQueue)
				.addFunction("DeclareQueue",&wrappers::Channel::DeclareQueue)
				.addFunction("DeleteQueue",&wrappers::Channel::DeleteQueue)
				.addFunction("BindQueue",&wrappers::Channel::BindQueue)
				.addFunction("UnbindQueue",&wrappers::Channel::UnbindQueue)
				.addFunction("PurgeQueue",&wrappers::Channel::PurgeQueue)
				.addFunction("BasicConsume",&wrappers::Channel::BasicConsume)
				.addFunction("SimpleBasicConsume",&wrappers::Channel::SimpleBasicConsume)
				.addFunction("BasicConsumeMessage",&wrappers::Channel::BasicConsumeMessage)
				.addFunction("BasicPublish",&wrappers::Channel::BasicPublish)
			.endClass()


		.endNamespace()
		;
}

}
