##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Studio
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Studio < StudioBase
            class V2 < Version
                class FlowValidateList < ListResource
                    ##
                    # Initialize the FlowValidateList
                    # @param [Version] version Version that contains the resource
                    # @return [FlowValidateList] FlowValidateList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Flows/Validate"
                        
                    end
                    ##
                    # Update the FlowValidateInstance
                    # @param [String] friendly_name The string that you assigned to describe the Flow.
                    # @param [Status] status 
                    # @param [Object] definition JSON representation of flow definition.
                    # @param [String] commit_message Description of change made in the revision.
                    # @return [FlowValidateInstance] Updated FlowValidateInstance
                    def update(
                        friendly_name: nil, 
                        status: nil, 
                        definition: nil, 
                        commit_message: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Status' => status,
                            'Definition' => Twilio.serialize_object(definition),
                            'CommitMessage' => commit_message,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        FlowValidateInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Studio.V2.FlowValidateList>'
                    end
                end

                class FlowValidatePage < Page
                    ##
                    # Initialize the FlowValidatePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [FlowValidatePage] FlowValidatePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of FlowValidateInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [FlowValidateInstance] FlowValidateInstance
                    def get_instance(payload)
                        FlowValidateInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Studio.V2.FlowValidatePage>'
                    end
                end
                class FlowValidateInstance < InstanceResource
                    ##
                    # Initialize the FlowValidateInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this FlowValidate
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [FlowValidateInstance] FlowValidateInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'valid' => payload['valid'],
                        }
                    end

                    
                    ##
                    # @return [Boolean] Boolean if the flow definition is valid.
                    def valid
                        @properties['valid']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Studio.V2.FlowValidateInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Studio.V2.FlowValidateInstance>"
                    end
                end

            end
        end
    end
end