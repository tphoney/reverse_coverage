##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Conversations
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class Conversations
            class V1 < Version
                ##
                # Initialize the V1 version of Conversations
                def initialize(domain)
                    super
                    @version = 'v1'
                    @address_configurations = nil
                    @configuration = nil
                    @conversations = nil
                    @credentials = nil
                    @participant_conversations = nil
                    @roles = nil
                    @services = nil
                    @users = nil
                end

                ##
                # @param [String] sid The SID of the Address Configuration resource. This value can be either the `sid` or the `address` of the configuration
                # @return [Twilio::REST::Conversations::V1::AddressConfigurationContext] if sid was passed.
                # @return [Twilio::REST::Conversations::V1::AddressConfigurationList]
                def address_configurations(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @address_configurations ||= AddressConfigurationList.new self
                    else
                        AddressConfigurationContext.new(self, sid)
                    end
                end
                ##
                # @return [Twilio::REST::Conversations::V1::configurationContext]
                def configuration
                    @configuration ||= ConfigurationContext.new self
                end
                ##
                # @param [String] sid A 34 character string that uniquely identifies this resource. Can also be the `unique_name` of the Conversation.
                # @return [Twilio::REST::Conversations::V1::ConversationContext] if sid was passed.
                # @return [Twilio::REST::Conversations::V1::ConversationList]
                def conversations(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @conversations ||= ConversationList.new self
                    else
                        ConversationContext.new(self, sid)
                    end
                end
                ##
                # @param [String] sid A 34 character string that uniquely identifies this resource.
                # @return [Twilio::REST::Conversations::V1::CredentialContext] if sid was passed.
                # @return [Twilio::REST::Conversations::V1::CredentialList]
                def credentials(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @credentials ||= CredentialList.new self
                    else
                        CredentialContext.new(self, sid)
                    end
                end
                ##
                # @return [Twilio::REST::Conversations::V1::ParticipantConversationList]
                def participant_conversations
                    @participant_conversations ||= ParticipantConversationList.new self
                end
                ##
                # @param [String] sid The SID of the Role resource to fetch.
                # @return [Twilio::REST::Conversations::V1::RoleContext] if sid was passed.
                # @return [Twilio::REST::Conversations::V1::RoleList]
                def roles(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @roles ||= RoleList.new self
                    else
                        RoleContext.new(self, sid)
                    end
                end
                ##
                # @param [String] sid A 34 character string that uniquely identifies this resource.
                # @return [Twilio::REST::Conversations::V1::ServiceContext] if sid was passed.
                # @return [Twilio::REST::Conversations::V1::ServiceList]
                def services(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @services ||= ServiceList.new self
                    else
                        ServiceContext.new(self, sid)
                    end
                end
                ##
                # @param [String] sid The SID of the User resource to fetch. This value can be either the `sid` or the `identity` of the User resource to fetch.
                # @return [Twilio::REST::Conversations::V1::UserContext] if sid was passed.
                # @return [Twilio::REST::Conversations::V1::UserList]
                def users(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @users ||= UserList.new self
                    else
                        UserContext.new(self, sid)
                    end
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Conversations::V1>';
                end
            end
        end
    end
end