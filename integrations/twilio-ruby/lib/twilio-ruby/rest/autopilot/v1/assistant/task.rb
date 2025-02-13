##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Autopilot
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Autopilot < AutopilotBase
            class V1 < Version
                class AssistantContext < InstanceContext

                     class TaskList < ListResource
                    ##
                    # Initialize the TaskList
                    # @param [Version] version Version that contains the resource
                    # @return [TaskList] TaskList
                    def initialize(version, assistant_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { assistant_sid: assistant_sid }
                        @uri = "/Assistants/#{@solution[:assistant_sid]}/Tasks"
                        
                    end
                    ##
                    # Create the TaskInstance
                    # @param [String] unique_name An application-defined string that uniquely identifies the new resource. It can be used as an alternative to the `sid` in the URL path to address the resource. This value must be unique and 64 characters or less in length.
                    # @param [String] friendly_name A descriptive string that you create to describe the new resource. It is not unique and can be up to 255 characters long.
                    # @param [Object] actions The JSON string that specifies the [actions](https://www.twilio.com/docs/autopilot/actions) that instruct the Assistant on how to perform the task. It is optional and not unique.
                    # @param [String] actions_url The URL from which the Assistant can fetch actions.
                    # @return [TaskInstance] Created TaskInstance
                    def create(
                        unique_name: nil, 
                        friendly_name: :unset, 
                        actions: :unset, 
                        actions_url: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'FriendlyName' => friendly_name,
                            'Actions' => Twilio.serialize_object(actions),
                            'ActionsUrl' => actions_url,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        TaskInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                        )
                    end

                
                    ##
                    # Lists TaskInstance records from the API as a list.
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
                    # When passed a block, yields TaskInstance records from the API.
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
                    # Retrieve a single page of TaskInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TaskInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        TaskPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TaskInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TaskInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TaskPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Autopilot.V1.TaskList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class TaskContext < InstanceContext
                    ##
                    # Initialize the TaskContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] assistant_sid The SID of the [Assistant](https://www.twilio.com/docs/autopilot/api/assistant) that is the parent of the resource to update.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Task resource to update.
                    # @return [TaskContext] TaskContext
                    def initialize(version, assistant_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { assistant_sid: assistant_sid, sid: sid,  }
                        @uri = "/Assistants/#{@solution[:assistant_sid]}/Tasks/#{@solution[:sid]}"

                        # Dependents
                        @samples = nil
                        @task_actions = nil
                        @statistics = nil
                        @fields = nil
                    end
                    ##
                    # Delete the TaskInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the TaskInstance
                    # @return [TaskInstance] Fetched TaskInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        TaskInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the TaskInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. This value must be 64 characters or less in length and be unique. It can be used as an alternative to the `sid` in the URL path to address the resource.
                    # @param [Object] actions The JSON string that specifies the [actions](https://www.twilio.com/docs/autopilot/actions) that instruct the Assistant on how to perform the task.
                    # @param [String] actions_url The URL from which the Assistant can fetch actions.
                    # @return [TaskInstance] Updated TaskInstance
                    def update(
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        actions: :unset, 
                        actions_url: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'UniqueName' => unique_name,
                            'Actions' => Twilio.serialize_object(actions),
                            'ActionsUrl' => actions_url,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        TaskInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the samples
                    # @return [SampleList]
                    # @return [SampleContext] if sid was passed.
                    def samples(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return SampleContext.new(@version, @solution[:assistant_sid], @solution[:sid],sid )
                        end

                        unless @samples
                            @samples = SampleList.new(
                                @version, assistant_sid: @solution[:assistant_sid],  task_sid: @solution[:sid], )
                        end

                     @samples
                    end
                    ##
                    # Access the task_actions
                    # @return [TaskActionsList]
                    # @return [TaskActionsContext]
                    def task_actions
                        TaskActionsContext.new(
                                @version,
                                @solution[:assistant_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the statistics
                    # @return [TaskStatisticsList]
                    # @return [TaskStatisticsContext]
                    def statistics
                        TaskStatisticsContext.new(
                                @version,
                                @solution[:assistant_sid],
                                @solution[:sid]
                                )
                    end
                    ##
                    # Access the fields
                    # @return [FieldList]
                    # @return [FieldContext] if sid was passed.
                    def fields(sid=:unset)

                        raise ArgumentError, 'sid cannot be nil' if sid.nil?

                        if sid != :unset
                            return FieldContext.new(@version, @solution[:assistant_sid], @solution[:sid],sid )
                        end

                        unless @fields
                            @fields = FieldList.new(
                                @version, assistant_sid: @solution[:assistant_sid],  task_sid: @solution[:sid], )
                        end

                     @fields
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Autopilot.V1.TaskContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Autopilot.V1.TaskContext #{context}>"
                    end
                end

                class TaskPage < Page
                    ##
                    # Initialize the TaskPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TaskPage] TaskPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TaskInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TaskInstance] TaskInstance
                    def get_instance(payload)
                        TaskInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Autopilot.V1.TaskPage>'
                    end
                end
                class TaskInstance < InstanceResource
                    ##
                    # Initialize the TaskInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Task
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TaskInstance] TaskInstance
                    def initialize(version, payload , assistant_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'friendly_name' => payload['friendly_name'],
                            'links' => payload['links'],
                            'assistant_sid' => payload['assistant_sid'],
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'actions_url' => payload['actions_url'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'assistant_sid' => assistant_sid  || @properties['assistant_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TaskContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TaskContext.new(@version , @params['assistant_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Task resource.
                    def account_sid
                        @properties['account_sid']
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
                    # @return [String] The string that you assigned to describe the resource. It is not unique and can be up to 255 characters long.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Hash] A list of the URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] The SID of the [Assistant](https://www.twilio.com/docs/autopilot/api/assistant) that is the parent of the resource.
                    def assistant_sid
                        @properties['assistant_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Task resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource.
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] The URL from which the Assistant can fetch actions.
                    def actions_url
                        @properties['actions_url']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Task resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the TaskInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the TaskInstance
                    # @return [TaskInstance] Fetched TaskInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the TaskInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is not unique and can be up to 255 characters long.
                    # @param [String] unique_name An application-defined string that uniquely identifies the resource. This value must be 64 characters or less in length and be unique. It can be used as an alternative to the `sid` in the URL path to address the resource.
                    # @param [Object] actions The JSON string that specifies the [actions](https://www.twilio.com/docs/autopilot/actions) that instruct the Assistant on how to perform the task.
                    # @param [String] actions_url The URL from which the Assistant can fetch actions.
                    # @return [TaskInstance] Updated TaskInstance
                    def update(
                        friendly_name: :unset, 
                        unique_name: :unset, 
                        actions: :unset, 
                        actions_url: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            unique_name: unique_name, 
                            actions: actions, 
                            actions_url: actions_url, 
                        )
                    end

                    ##
                    # Access the samples
                    # @return [samples] samples
                    def samples
                        context.samples
                    end

                    ##
                    # Access the task_actions
                    # @return [task_actions] task_actions
                    def task_actions
                        context.task_actions
                    end

                    ##
                    # Access the statistics
                    # @return [statistics] statistics
                    def statistics
                        context.statistics
                    end

                    ##
                    # Access the fields
                    # @return [fields] fields
                    def fields
                        context.fields
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Autopilot.V1.TaskInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Autopilot.V1.TaskInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


