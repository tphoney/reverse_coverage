##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Preview
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Preview < PreviewBase
            class HostedNumbers < Version
                class AuthorizationDocumentContext < InstanceContext

                     class DependentHostedNumberOrderList < ListResource
                    ##
                    # Initialize the DependentHostedNumberOrderList
                    # @param [Version] version Version that contains the resource
                    # @return [DependentHostedNumberOrderList] DependentHostedNumberOrderList
                    def initialize(version, signing_document_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { signing_document_sid: signing_document_sid }
                        @uri = "/AuthorizationDocuments/#{@solution[:signing_document_sid]}/DependentHostedNumberOrders"
                        
                    end
                
                    ##
                    # Lists DependentHostedNumberOrderInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Status] status Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
                    # @param [String] phone_number An E164 formatted phone number hosted by this HostedNumberOrder.
                    # @param [String] incoming_phone_number_sid A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, limit: nil, page_size: nil)
                        self.stream(
                            status: status,
                            phone_number: phone_number,
                            incoming_phone_number_sid: incoming_phone_number_sid,
                            friendly_name: friendly_name,
                            unique_name: unique_name,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Status] status Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
                    # @param [String] phone_number An E164 formatted phone number hosted by this HostedNumberOrder.
                    # @param [String] incoming_phone_number_sid A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            status: status,
                            phone_number: phone_number,
                            incoming_phone_number_sid: incoming_phone_number_sid,
                            friendly_name: friendly_name,
                            unique_name: unique_name,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields DependentHostedNumberOrderInstance records from the API.
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
                    # Retrieve a single page of DependentHostedNumberOrderInstance records from the API.
                    # Request is executed immediately.
                    # @param [Status] status Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/api/phone-numbers/hosted-number-authorization-documents#status-values) for more information on each of these statuses.
                    # @param [String] phone_number An E164 formatted phone number hosted by this HostedNumberOrder.
                    # @param [String] incoming_phone_number_sid A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
                    # @param [String] friendly_name A human readable description of this resource, up to 64 characters.
                    # @param [String] unique_name Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of DependentHostedNumberOrderInstance
                    def page(status: :unset, phone_number: :unset, incoming_phone_number_sid: :unset, friendly_name: :unset, unique_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Status' => status,
                            
                            'PhoneNumber' => phone_number,
                            
                            'IncomingPhoneNumberSid' => incoming_phone_number_sid,
                            
                            'FriendlyName' => friendly_name,
                            
                            'UniqueName' => unique_name,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        DependentHostedNumberOrderPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of DependentHostedNumberOrderInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of DependentHostedNumberOrderInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    DependentHostedNumberOrderPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderList>'
                    end
                end

                class DependentHostedNumberOrderPage < Page
                    ##
                    # Initialize the DependentHostedNumberOrderPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DependentHostedNumberOrderPage] DependentHostedNumberOrderPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DependentHostedNumberOrderInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DependentHostedNumberOrderInstance] DependentHostedNumberOrderInstance
                    def get_instance(payload)
                        DependentHostedNumberOrderInstance.new(@version, payload, signing_document_sid: @solution[:signing_document_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderPage>'
                    end
                end
                class DependentHostedNumberOrderInstance < InstanceResource
                    ##
                    # Initialize the DependentHostedNumberOrderInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this DependentHostedNumberOrder
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DependentHostedNumberOrderInstance] DependentHostedNumberOrderInstance
                    def initialize(version, payload , signing_document_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'incoming_phone_number_sid' => payload['incoming_phone_number_sid'],
                            'address_sid' => payload['address_sid'],
                            'signing_document_sid' => payload['signing_document_sid'],
                            'phone_number' => payload['phone_number'],
                            'capabilities' => payload['capabilities'],
                            'friendly_name' => payload['friendly_name'],
                            'unique_name' => payload['unique_name'],
                            'status' => payload['status'],
                            'failure_reason' => payload['failure_reason'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'verification_attempts' => payload['verification_attempts'] == nil ? payload['verification_attempts'] : payload['verification_attempts'].to_i,
                            'email' => payload['email'],
                            'cc_emails' => payload['cc_emails'],
                            'verification_type' => payload['verification_type'],
                            'verification_document_sid' => payload['verification_document_sid'],
                            'extension' => payload['extension'],
                            'call_delay' => payload['call_delay'] == nil ? payload['call_delay'] : payload['call_delay'].to_i,
                            'verification_code' => payload['verification_code'],
                            'verification_call_sids' => payload['verification_call_sids'],
                        }
                    end

                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Authorization Document
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the IncomingPhoneNumber resource created by this HostedNumberOrder.
                    def incoming_phone_number_sid
                        @properties['incoming_phone_number_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the Address resource that represents the address of the owner of this phone number.
                    def address_sid
                        @properties['address_sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the LOA document associated with this HostedNumberOrder.
                    def signing_document_sid
                        @properties['signing_document_sid']
                    end
                    
                    ##
                    # @return [String] An E164 formatted phone number hosted by this HostedNumberOrder.
                    def phone_number
                        @properties['phone_number']
                    end
                    
                    ##
                    # @return [PreviewHostedNumbersAuthorizationDocumentDependentHostedNumberOrderCapabilities] 
                    def capabilities
                        @properties['capabilities']
                    end
                    
                    ##
                    # @return [String] A human readable description of this resource, up to 64 characters.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] Provides a unique and addressable name to be assigned to this HostedNumberOrder, assigned by the developer, to be optionally used in addition to SID.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] A message that explains why a hosted_number_order went to status \"action-required\"
                    def failure_reason
                        @properties['failure_reason']
                    end
                    
                    ##
                    # @return [Time] The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this resource was updated, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The number of attempts made to verify ownership of the phone number that is being hosted.
                    def verification_attempts
                        @properties['verification_attempts']
                    end
                    
                    ##
                    # @return [String] Email of the owner of this phone number that is being hosted.
                    def email
                        @properties['email']
                    end
                    
                    ##
                    # @return [Array<String>] Email recipients who will be informed when an Authorization Document has been sent and signed
                    def cc_emails
                        @properties['cc_emails']
                    end
                    
                    ##
                    # @return [VerificationType] 
                    def verification_type
                        @properties['verification_type']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the Identity Document resource that represents the document for verifying ownership of the number to be hosted.
                    def verification_document_sid
                        @properties['verification_document_sid']
                    end
                    
                    ##
                    # @return [String] A numerical extension to be used when making the ownership verification call.
                    def extension
                        @properties['extension']
                    end
                    
                    ##
                    # @return [String] A value between 0-30 specifying the number of seconds to delay initiating the ownership verification call.
                    def call_delay
                        @properties['call_delay']
                    end
                    
                    ##
                    # @return [String] The digits passed during the ownership verification call.
                    def verification_code
                        @properties['verification_code']
                    end
                    
                    ##
                    # @return [Array<String>] A list of 34 character strings that are unique identifiers for the calls placed as part of ownership verification.
                    def verification_call_sids
                        @properties['verification_call_sids']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Preview.HostedNumbers.DependentHostedNumberOrderInstance>"
                    end
                end

             end
            end
        end
    end
end

