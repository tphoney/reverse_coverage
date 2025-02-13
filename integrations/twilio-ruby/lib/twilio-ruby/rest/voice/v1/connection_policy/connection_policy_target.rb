##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Voice
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Voice < VoiceBase
            class V1 < Version
                class ConnectionPolicyContext < InstanceContext

                     class ConnectionPolicyTargetList < ListResource
                    ##
                    # Initialize the ConnectionPolicyTargetList
                    # @param [Version] version Version that contains the resource
                    # @return [ConnectionPolicyTargetList] ConnectionPolicyTargetList
                    def initialize(version, connection_policy_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { connection_policy_sid: connection_policy_sid }
                        @uri = "/ConnectionPolicies/#{@solution[:connection_policy_sid]}/Targets"
                        
                    end
                    ##
                    # Create the ConnectionPolicyTargetInstance
                    # @param [String] target The SIP address you want Twilio to route your calls to. This must be a `sip:` schema. `sips` is NOT supported.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @param [String] priority The relative importance of the target. Can be an integer from 0 to 65535, inclusive, and the default is 10. The lowest number represents the most important target.
                    # @param [String] weight The value that determines the relative share of the load the Target should receive compared to other Targets with the same priority. Can be an integer from 1 to 65535, inclusive, and the default is 10. Targets with higher values receive more load than those with lower ones with the same priority.
                    # @param [Boolean] enabled Whether the Target is enabled. The default is `true`.
                    # @return [ConnectionPolicyTargetInstance] Created ConnectionPolicyTargetInstance
                    def create(
                        target: nil, 
                        friendly_name: :unset, 
                        priority: :unset, 
                        weight: :unset, 
                        enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'Target' => target,
                            'FriendlyName' => friendly_name,
                            'Priority' => priority,
                            'Weight' => weight,
                            'Enabled' => enabled,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        ConnectionPolicyTargetInstance.new(
                            @version,
                            payload,
                            connection_policy_sid: @solution[:connection_policy_sid],
                        )
                    end

                
                    ##
                    # Lists ConnectionPolicyTargetInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields ConnectionPolicyTargetInstance records from the API.
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
                    # Retrieve a single page of ConnectionPolicyTargetInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ConnectionPolicyTargetInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        ConnectionPolicyTargetPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ConnectionPolicyTargetInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ConnectionPolicyTargetInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ConnectionPolicyTargetPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Voice.V1.ConnectionPolicyTargetList>'
                    end
                end


                class ConnectionPolicyTargetContext < InstanceContext
                    ##
                    # Initialize the ConnectionPolicyTargetContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] connection_policy_sid The SID of the Connection Policy that owns the Target.
                    # @param [String] sid The unique string that we created to identify the Target resource to update.
                    # @return [ConnectionPolicyTargetContext] ConnectionPolicyTargetContext
                    def initialize(version, connection_policy_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { connection_policy_sid: connection_policy_sid, sid: sid,  }
                        @uri = "/ConnectionPolicies/#{@solution[:connection_policy_sid]}/Targets/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the ConnectionPolicyTargetInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the ConnectionPolicyTargetInstance
                    # @return [ConnectionPolicyTargetInstance] Fetched ConnectionPolicyTargetInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        ConnectionPolicyTargetInstance.new(
                            @version,
                            payload,
                            connection_policy_sid: @solution[:connection_policy_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ConnectionPolicyTargetInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @param [String] target The SIP address you want Twilio to route your calls to. This must be a `sip:` schema. `sips` is NOT supported.
                    # @param [String] priority The relative importance of the target. Can be an integer from 0 to 65535, inclusive. The lowest number represents the most important target.
                    # @param [String] weight The value that determines the relative share of the load the Target should receive compared to other Targets with the same priority. Can be an integer from 1 to 65535, inclusive. Targets with higher values receive more load than those with lower ones with the same priority.
                    # @param [Boolean] enabled Whether the Target is enabled.
                    # @return [ConnectionPolicyTargetInstance] Updated ConnectionPolicyTargetInstance
                    def update(
                        friendly_name: :unset, 
                        target: :unset, 
                        priority: :unset, 
                        weight: :unset, 
                        enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Target' => target,
                            'Priority' => priority,
                            'Weight' => weight,
                            'Enabled' => enabled,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        ConnectionPolicyTargetInstance.new(
                            @version,
                            payload,
                            connection_policy_sid: @solution[:connection_policy_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.ConnectionPolicyTargetContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Voice.V1.ConnectionPolicyTargetContext #{context}>"
                    end
                end

                class ConnectionPolicyTargetPage < Page
                    ##
                    # Initialize the ConnectionPolicyTargetPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ConnectionPolicyTargetPage] ConnectionPolicyTargetPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ConnectionPolicyTargetInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ConnectionPolicyTargetInstance] ConnectionPolicyTargetInstance
                    def get_instance(payload)
                        ConnectionPolicyTargetInstance.new(@version, payload, connection_policy_sid: @solution[:connection_policy_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Voice.V1.ConnectionPolicyTargetPage>'
                    end
                end
                class ConnectionPolicyTargetInstance < InstanceResource
                    ##
                    # Initialize the ConnectionPolicyTargetInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ConnectionPolicyTarget
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ConnectionPolicyTargetInstance] ConnectionPolicyTargetInstance
                    def initialize(version, payload , connection_policy_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'connection_policy_sid' => payload['connection_policy_sid'],
                            'sid' => payload['sid'],
                            'friendly_name' => payload['friendly_name'],
                            'target' => payload['target'],
                            'priority' => payload['priority'] == nil ? payload['priority'] : payload['priority'].to_i,
                            'weight' => payload['weight'] == nil ? payload['weight'] : payload['weight'].to_i,
                            'enabled' => payload['enabled'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'connection_policy_sid' => connection_policy_sid  || @properties['connection_policy_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ConnectionPolicyTargetContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ConnectionPolicyTargetContext.new(@version , @params['connection_policy_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Target resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Connection Policy that owns the Target.
                    def connection_policy_sid
                        @properties['connection_policy_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Target resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The SIP address you want Twilio to route your calls to. This must be a `sip:` schema. `sips` is NOT supported.
                    def target
                        @properties['target']
                    end
                    
                    ##
                    # @return [String] The relative importance of the target. Can be an integer from 0 to 65535, inclusive, and the default is 10. The lowest number represents the most important target.
                    def priority
                        @properties['priority']
                    end
                    
                    ##
                    # @return [String] The value that determines the relative share of the load the Target should receive compared to other Targets with the same priority. Can be an integer from 1 to 65535, inclusive, and the default is 10. Targets with higher values receive more load than those with lower ones with the same priority.
                    def weight
                        @properties['weight']
                    end
                    
                    ##
                    # @return [Boolean] Whether the target is enabled. The default is `true`.
                    def enabled
                        @properties['enabled']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the ConnectionPolicyTargetInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the ConnectionPolicyTargetInstance
                    # @return [ConnectionPolicyTargetInstance] Fetched ConnectionPolicyTargetInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ConnectionPolicyTargetInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @param [String] target The SIP address you want Twilio to route your calls to. This must be a `sip:` schema. `sips` is NOT supported.
                    # @param [String] priority The relative importance of the target. Can be an integer from 0 to 65535, inclusive. The lowest number represents the most important target.
                    # @param [String] weight The value that determines the relative share of the load the Target should receive compared to other Targets with the same priority. Can be an integer from 1 to 65535, inclusive. Targets with higher values receive more load than those with lower ones with the same priority.
                    # @param [Boolean] enabled Whether the Target is enabled.
                    # @return [ConnectionPolicyTargetInstance] Updated ConnectionPolicyTargetInstance
                    def update(
                        friendly_name: :unset, 
                        target: :unset, 
                        priority: :unset, 
                        weight: :unset, 
                        enabled: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            target: target, 
                            priority: priority, 
                            weight: weight, 
                            enabled: enabled, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.ConnectionPolicyTargetInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Voice.V1.ConnectionPolicyTargetInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


