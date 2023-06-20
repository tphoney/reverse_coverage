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
        class Conversations < ConversationsBase
            class V1 < Version
                class ServiceContext < InstanceContext

                     class ParticipantConversationList < ListResource
                    ##
                    # Initialize the ParticipantConversationList
                    # @param [Version] version Version that contains the resource
                    # @return [ParticipantConversationList] ParticipantConversationList
                    def initialize(version, chat_service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { chat_service_sid: chat_service_sid }
                        @uri = "/Services/#{@solution[:chat_service_sid]}/ParticipantConversations"
                        
                    end
                
                    ##
                    # Lists ParticipantConversationInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] identity A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    # @param [String] address A unique string identifier for the conversation participant who's not a Conversation User. This parameter could be found in messaging_binding.address field of Participant resource. It should be url-encoded.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(identity: :unset, address: :unset, limit: nil, page_size: nil)
                        self.stream(
                            identity: identity,
                            address: address,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] identity A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    # @param [String] address A unique string identifier for the conversation participant who's not a Conversation User. This parameter could be found in messaging_binding.address field of Participant resource. It should be url-encoded.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(identity: :unset, address: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            identity: identity,
                            address: address,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields ParticipantConversationInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of ParticipantConversationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] identity A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    # @param [String] address A unique string identifier for the conversation participant who's not a Conversation User. This parameter could be found in messaging_binding.address field of Participant resource. It should be url-encoded.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ParticipantConversationInstance
                    def page(identity: :unset, address: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Identity' => identity,
                            
                            'Address' => address,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ParticipantConversationPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ParticipantConversationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ParticipantConversationInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ParticipantConversationPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Conversations.V1.ParticipantConversationList>'
                    end
                end

                class ParticipantConversationPage < Page
                    ##
                    # Initialize the ParticipantConversationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ParticipantConversationPage] ParticipantConversationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ParticipantConversationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ParticipantConversationInstance] ParticipantConversationInstance
                    def get_instance(payload)
                        ParticipantConversationInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Conversations.V1.ParticipantConversationPage>'
                    end
                end
                class ParticipantConversationInstance < InstanceResource
                    ##
                    # Initialize the ParticipantConversationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ParticipantConversation
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ParticipantConversationInstance] ParticipantConversationInstance
                    def initialize(version, payload , chat_service_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'chat_service_sid' => payload['chat_service_sid'],
                            'participant_sid' => payload['participant_sid'],
                            'participant_user_sid' => payload['participant_user_sid'],
                            'participant_identity' => payload['participant_identity'],
                            'participant_messaging_binding' => payload['participant_messaging_binding'],
                            'conversation_sid' => payload['conversation_sid'],
                            'conversation_unique_name' => payload['conversation_unique_name'],
                            'conversation_friendly_name' => payload['conversation_friendly_name'],
                            'conversation_attributes' => payload['conversation_attributes'],
                            'conversation_date_created' => Twilio.deserialize_iso8601_datetime(payload['conversation_date_created']),
                            'conversation_date_updated' => Twilio.deserialize_iso8601_datetime(payload['conversation_date_updated']),
                            'conversation_created_by' => payload['conversation_created_by'],
                            'conversation_state' => payload['conversation_state'],
                            'conversation_timers' => payload['conversation_timers'],
                            'links' => payload['links'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique ID of the [Account](https://www.twilio.com/docs/iam/api/account) responsible for this conversation.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique ID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) this conversation belongs to.
                    def chat_service_sid
                        @properties['chat_service_sid']
                    end
                    
                    ##
                    # @return [String] The unique ID of the [Participant](https://www.twilio.com/docs/conversations/api/conversation-participant-resource).
                    def participant_sid
                        @properties['participant_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that identifies the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource).
                    def participant_user_sid
                        @properties['participant_user_sid']
                    end
                    
                    ##
                    # @return [String] A unique string identifier for the conversation participant as [Conversation User](https://www.twilio.com/docs/conversations/api/user-resource). This parameter is non-null if (and only if) the participant is using the Conversations SDK to communicate. Limited to 256 characters.
                    def participant_identity
                        @properties['participant_identity']
                    end
                    
                    ##
                    # @return [Hash] Information about how this participant exchanges messages with the conversation. A JSON parameter consisting of type and address fields of the participant.
                    def participant_messaging_binding
                        @properties['participant_messaging_binding']
                    end
                    
                    ##
                    # @return [String] The unique ID of the [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) this Participant belongs to.
                    def conversation_sid
                        @properties['conversation_sid']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the Conversation resource.
                    def conversation_unique_name
                        @properties['conversation_unique_name']
                    end
                    
                    ##
                    # @return [String] The human-readable name of this conversation, limited to 256 characters. Optional.
                    def conversation_friendly_name
                        @properties['conversation_friendly_name']
                    end
                    
                    ##
                    # @return [String] An optional string metadata field you can use to store any data you wish. The string value must contain structurally valid JSON if specified.  **Note** that if the attributes are not set \"{}\" will be returned.
                    def conversation_attributes
                        @properties['conversation_attributes']
                    end
                    
                    ##
                    # @return [Time] The date that this conversation was created, given in ISO 8601 format.
                    def conversation_date_created
                        @properties['conversation_date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this conversation was last updated, given in ISO 8601 format.
                    def conversation_date_updated
                        @properties['conversation_date_updated']
                    end
                    
                    ##
                    # @return [String] Identity of the creator of this Conversation.
                    def conversation_created_by
                        @properties['conversation_created_by']
                    end
                    
                    ##
                    # @return [State] 
                    def conversation_state
                        @properties['conversation_state']
                    end
                    
                    ##
                    # @return [Hash] Timer date values representing state update for this conversation.
                    def conversation_timers
                        @properties['conversation_timers']
                    end
                    
                    ##
                    # @return [Hash] Contains absolute URLs to access the [participant](https://www.twilio.com/docs/conversations/api/conversation-participant-resource) and [conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) of this conversation.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Conversations.V1.ParticipantConversationInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Conversations.V1.ParticipantConversationInstance>"
                    end
                end

             end
            end
        end
    end
end


