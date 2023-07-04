##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Verify
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Verify < VerifyBase
            class V2 < Version
                class VerificationAttemptsSummaryList < ListResource
                    ##
                    # Initialize the VerificationAttemptsSummaryList
                    # @param [Version] version Version that contains the resource
                    # @return [VerificationAttemptsSummaryList] VerificationAttemptsSummaryList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.VerificationAttemptsSummaryList>'
                    end
                end


                class VerificationAttemptsSummaryContext < InstanceContext
                    ##
                    # Initialize the VerificationAttemptsSummaryContext
                    # @param [Version] version Version that contains the resource
                    # @return [VerificationAttemptsSummaryContext] VerificationAttemptsSummaryContext
                    def initialize(version)
                        super(version)

                        # Path Solution
                        @solution = {  }
                        @uri = "/Attempts/Summary"

                        
                    end
                    ##
                    # Fetch the VerificationAttemptsSummaryInstance
                    # @param [String] verify_service_sid Filter used to consider only Verification Attempts of the given verify service on the summary aggregation.
                    # @param [Time] date_created_after Datetime filter used to consider only Verification Attempts created after this datetime on the summary aggregation. Given as GMT in RFC 2822 format.
                    # @param [Time] date_created_before Datetime filter used to consider only Verification Attempts created before this datetime on the summary aggregation. Given as GMT in RFC 2822 format.
                    # @param [String] country Filter used to consider only Verification Attempts sent to the specified destination country on the summary aggregation.
                    # @param [Channels] channel Filter Verification Attempts considered on the summary aggregation by communication channel. Valid values are `SMS` and `CALL`
                    # @param [String] destination_prefix Filter the Verification Attempts considered on the summary aggregation by Destination prefix. It is the prefix of a phone number in E.164 format.
                    # @return [VerificationAttemptsSummaryInstance] Fetched VerificationAttemptsSummaryInstance
                    def fetch(
                        verify_service_sid: :unset, 
                        date_created_after: :unset, 
                        date_created_before: :unset, 
                        country: :unset, 
                        channel: :unset, 
                        destination_prefix: :unset
                    )

                        params = Twilio::Values.of({
                            'VerifyServiceSid' => verify_service_sid,
                            'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                            'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                            'Country' => country,
                            'Channel' => channel,
                            'DestinationPrefix' => destination_prefix,
                        })
                        payload = @version.fetch('GET', @uri, params: params)
                        VerificationAttemptsSummaryInstance.new(
                            @version,
                            payload,
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.VerificationAttemptsSummaryContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.VerificationAttemptsSummaryContext #{context}>"
                    end
                end

                class VerificationAttemptsSummaryPage < Page
                    ##
                    # Initialize the VerificationAttemptsSummaryPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [VerificationAttemptsSummaryPage] VerificationAttemptsSummaryPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of VerificationAttemptsSummaryInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [VerificationAttemptsSummaryInstance] VerificationAttemptsSummaryInstance
                    def get_instance(payload)
                        VerificationAttemptsSummaryInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.VerificationAttemptsSummaryPage>'
                    end
                end
                class VerificationAttemptsSummaryInstance < InstanceResource
                    ##
                    # Initialize the VerificationAttemptsSummaryInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this VerificationAttemptsSummary
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [VerificationAttemptsSummaryInstance] VerificationAttemptsSummaryInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'total_attempts' => payload['total_attempts'] == nil ? payload['total_attempts'] : payload['total_attempts'].to_i,
                            'total_converted' => payload['total_converted'] == nil ? payload['total_converted'] : payload['total_converted'].to_i,
                            'total_unconverted' => payload['total_unconverted'] == nil ? payload['total_unconverted'] : payload['total_unconverted'].to_i,
                            'conversion_rate_percentage' => payload['conversion_rate_percentage'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = {  }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [VerificationAttemptsSummaryContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = VerificationAttemptsSummaryContext.new(@version )
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] Total of attempts made according to the provided filters
                    def total_attempts
                        @properties['total_attempts']
                    end
                    
                    ##
                    # @return [String] Total of  attempts made that were confirmed by the end user, according to the provided filters.
                    def total_converted
                        @properties['total_converted']
                    end
                    
                    ##
                    # @return [String] Total of attempts made that were not confirmed by the end user, according to the provided filters.
                    def total_unconverted
                        @properties['total_unconverted']
                    end
                    
                    ##
                    # @return [Float] Percentage of the confirmed messages over the total, defined by (total_converted/total_attempts)*100. 
                    def conversion_rate_percentage
                        @properties['conversion_rate_percentage']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the VerificationAttemptsSummaryInstance
                    # @param [String] verify_service_sid Filter used to consider only Verification Attempts of the given verify service on the summary aggregation.
                    # @param [Time] date_created_after Datetime filter used to consider only Verification Attempts created after this datetime on the summary aggregation. Given as GMT in RFC 2822 format.
                    # @param [Time] date_created_before Datetime filter used to consider only Verification Attempts created before this datetime on the summary aggregation. Given as GMT in RFC 2822 format.
                    # @param [String] country Filter used to consider only Verification Attempts sent to the specified destination country on the summary aggregation.
                    # @param [Channels] channel Filter Verification Attempts considered on the summary aggregation by communication channel. Valid values are `SMS` and `CALL`
                    # @param [String] destination_prefix Filter the Verification Attempts considered on the summary aggregation by Destination prefix. It is the prefix of a phone number in E.164 format.
                    # @return [VerificationAttemptsSummaryInstance] Fetched VerificationAttemptsSummaryInstance
                    def fetch(
                        verify_service_sid: :unset, 
                        date_created_after: :unset, 
                        date_created_before: :unset, 
                        country: :unset, 
                        channel: :unset, 
                        destination_prefix: :unset
                    )

                        context.fetch(
                            verify_service_sid: verify_service_sid, 
                            date_created_after: date_created_after, 
                            date_created_before: date_created_before, 
                            country: country, 
                            channel: channel, 
                            destination_prefix: destination_prefix, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.VerificationAttemptsSummaryInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.VerificationAttemptsSummaryInstance #{values}>"
                    end
                end

            end
        end
    end
end