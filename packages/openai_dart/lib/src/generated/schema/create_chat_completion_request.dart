// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of open_a_i_schema;

// ==========================================
// CLASS: CreateChatCompletionRequest
// ==========================================

/// Request object for the Create chat completion endpoint.
@freezed
class CreateChatCompletionRequest with _$CreateChatCompletionRequest {
  const CreateChatCompletionRequest._();

  /// Factory constructor for CreateChatCompletionRequest
  const factory CreateChatCompletionRequest({
    /// ID of the model to use. See the [model endpoint compatibility](https://platform.openai.com/docs/models#model-endpoint-compatibility)
    /// table for details on which models work with the Chat API.
    @_ChatCompletionModelConverter() required ChatCompletionModel model,

    /// A list of messages comprising the conversation so far. Depending on the [model](https://platform.openai.com/docs/models) you use,
    /// different message types (modalities) are supported,
    /// like [text](https://platform.openai.com/docs/guides/text-generation),
    /// [images](https://platform.openai.com/docs/guides/vision),
    /// and [audio](https://platform.openai.com/docs/guides/audio).
    required List<ChatCompletionMessage> messages,

    /// Whether or not to store the output of this chat completion request for use in our
    /// [model distillation](https://platform.openai.com/docs/guides/distillation)
    /// or [evals](https://platform.openai.com/docs/guides/evals) products.
    @JsonKey(includeIfNull: false) bool? store,

    /// Developer-defined tags and values used for filtering completions
    /// in the [dashboard](https://platform.openai.com/chat-completions).
    @JsonKey(includeIfNull: false) Map<String, String>? metadata,

    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the
    /// text so far, decreasing the model's likelihood to repeat the same line verbatim.
    ///
    /// [See more information about frequency and presence penalties.](https://platform.openai.com/docs/guides/text-generation)
    @JsonKey(name: 'frequency_penalty', includeIfNull: false)
    @Default(0.0)
    double? frequencyPenalty,

    /// Modify the likelihood of specified tokens appearing in the completion.
    ///
    /// Accepts a JSON object that maps tokens (specified by their token ID in the tokenizer) to an associated bias
    /// value from -100 to 100. Mathematically, the bias is added to the logits generated by the model prior to
    /// sampling. The exact effect will vary per model, but values between -1 and 1 should decrease or increase
    /// likelihood of selection; values like -100 or 100 should result in a ban or exclusive selection of the
    /// relevant token.
    @JsonKey(name: 'logit_bias', includeIfNull: false)
    Map<String, int>? logitBias,

    /// Whether to return log probabilities of the output tokens or not. If true, returns the log probabilities of
    /// each output token returned in the `content` of `message`.
    @JsonKey(includeIfNull: false) bool? logprobs,

    /// An integer between 0 and 20 specifying the number of most likely tokens to return at each token position,
    /// each with an associated log probability. `logprobs` must be set to `true` if this parameter is used.
    @JsonKey(name: 'top_logprobs', includeIfNull: false) int? topLogprobs,

    /// The maximum number of [tokens](https://platform.openai.com/tokenizer) that can be generated in the chat
    /// completion. This value can be used to control [costs](https://openai.com/api/pricing/) for text generated
    /// via API.
    ///
    /// This value is now deprecated in favor of `max_completion_tokens`, and is not compatible with
    /// [o1 series models](https://platform.openai.com/docs/guides/reasoning).
    @JsonKey(name: 'max_tokens', includeIfNull: false) int? maxTokens,

    /// An upper bound for the number of tokens that can be generated for a completion, including visible output
    /// tokens and [reasoning tokens](https://platform.openai.com/docs/guides/reasoning).
    @JsonKey(name: 'max_completion_tokens', includeIfNull: false)
    int? maxCompletionTokens,

    /// How many chat completion choices to generate for each input message. Note that you will be charged based on
    /// the number of generated tokens across all of the choices. Keep `n` as `1` to minimize costs.
    @JsonKey(includeIfNull: false) @Default(1) int? n,

    /// A list of modalities that the model may use to generate the completion.
    @JsonKey(includeIfNull: false) List<ChatCompletionModality>? modalities,

    /// Configuration for a [Predicted Output](https://platform.openai.com/docs/guides/predicted-outputs),
    /// which can greatly improve response times when large parts of the model
    /// response are known ahead of time. This is most common when you are
    /// regenerating a file with only minor changes to most of the content.
    @JsonKey(includeIfNull: false) PredictionContent? prediction,

    /// Parameters for audio output. Required when audio output is requested with `modalities: ["audio"]`.
    /// [Learn more](https://platform.openai.com/docs/guides/audio).
    @JsonKey(includeIfNull: false) ChatCompletionAudioOptions? audio,

    /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
    ///
    /// [See more information about frequency and presence penalties.](https://platform.openai.com/docs/guides/text-generation)
    @JsonKey(name: 'presence_penalty', includeIfNull: false)
    @Default(0.0)
    double? presencePenalty,

    /// An object specifying the format that the model must output. Compatible with
    /// [GPT-4o](https://platform.openai.com/docs/models#gpt-4o),
    /// [GPT-4o mini](https://platform.openai.com/docs/models#gpt-4o-mini),
    /// [GPT-4 Turbo](https://platform.openai.com/docs/models#gpt-4-and-gpt-4-turbo) and all GPT-3.5 Turbo models newer
    /// than `gpt-3.5-turbo-1106`.
    ///
    /// Setting to `{ "type": "json_schema", "json_schema": {...} }` enables Structured Outputs which ensures the model
    /// will match your supplied JSON schema.
    /// Learn more in the [Structured Outputs guide](https://platform.openai.com/docs/guides/structured-outputs).
    ///
    /// Setting to `{ "type": "json_object" }` enables JSON mode, which ensures the message the model generates is
    /// valid JSON.
    ///
    /// **Important:** when using JSON mode, you **must** also instruct the model to produce JSON yourself via a system
    /// or user message. Without this, the model may generate an unending stream of whitespace until the generation
    /// reaches the token limit, resulting in a long-running and seemingly "stuck" request. Also note that the message
    /// content may be partially cut off if `finish_reason="length"`, which indicates the generation exceeded
    /// `max_tokens` or the conversation exceeded the max context length.
    /// Any of: [ResponseFormatText], [ResponseFormatJsonObject], [ResponseFormatJsonSchema]
    @JsonKey(name: 'response_format', includeIfNull: false)
    ResponseFormat? responseFormat,

    /// This feature is in Beta.
    /// If specified, our system will make a best effort to sample deterministically, such that repeated requests
    /// with the same `seed` and parameters should return the same result.
    /// Determinism is not guaranteed, and you should refer to the `system_fingerprint` response parameter to
    /// monitor changes in the backend.
    @JsonKey(includeIfNull: false) int? seed,

    /// Specifies the latency tier to use for processing the request. This parameter is relevant for customers
    /// subscribed to the scale tier service:
    ///   - If set to 'auto', and the Project is Scale tier enabled, the system will utilize scale tier credits
    ///     until they are exhausted.
    ///   - If set to 'auto', and the Project is not Scale tier enabled, the request will be processed using the
    ///     default service tier with a lower uptime SLA and no latency guarantee.
    ///   - If set to 'default', the request will be processed using the default service tier with a lower uptime
    ///     SLA and no latency guarantee.
    ///   - When not set, the default behavior is 'auto'.
    ///
    ///   When this parameter is set, the response body will include the `service_tier` utilized.
    @JsonKey(
      name: 'service_tier',
      includeIfNull: false,
      unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    )
    CreateChatCompletionRequestServiceTier? serviceTier,

    /// Up to 4 sequences where the API will stop generating further tokens.
    @_ChatCompletionStopConverter()
    @JsonKey(includeIfNull: false)
    ChatCompletionStop? stop,

    /// If set, partial message deltas will be sent, like in ChatGPT. Tokens will be sent as data-only  [server-sent events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#Event_stream_format) as they become available, with the stream terminated by a `data: [DONE]` message.  [Example Python code](https://cookbook.openai.com/examples/how_to_stream_completions).
    @JsonKey(includeIfNull: false) @Default(false) bool? stream,

    /// Options for streaming response. Only set this when you set `stream: true`.
    @JsonKey(name: 'stream_options', includeIfNull: false)
    ChatCompletionStreamOptions? streamOptions,

    /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic.
    ///
    /// We generally recommend altering this or `top_p` but not both.
    @JsonKey(includeIfNull: false) @Default(1.0) double? temperature,

    /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    ///
    /// We generally recommend altering this or `temperature` but not both.
    @JsonKey(name: 'top_p', includeIfNull: false) @Default(1.0) double? topP,

    /// A list of tools the model may call. Currently, only functions are supported as a tool.
    /// Use this to provide a list of functions the model may generate JSON inputs for. A max of 128 functions are
    /// supported.
    @JsonKey(includeIfNull: false) List<ChatCompletionTool>? tools,

    /// Controls which (if any) tool is called by the model.
    /// `none` means the model will not call any tool and instead generates a message.
    /// `auto` means the model can pick between generating a message or calling one or more tools.
    /// `required` means the model must call one or more tools.
    /// Specifying a particular tool via `{"type": "function", "function": {"name": "my_function"}}` forces the
    /// model to call that tool.
    ///
    /// `none` is the default when no tools are present. `auto` is the default if tools are present.
    @_ChatCompletionToolChoiceOptionConverter()
    @JsonKey(name: 'tool_choice', includeIfNull: false)
    ChatCompletionToolChoiceOption? toolChoice,

    /// Whether to enable [parallel function calling](https://platform.openai.com/docs/guides/function-calling#configuring-parallel-function-calling)
    /// during tool use.
    @JsonKey(name: 'parallel_tool_calls', includeIfNull: false)
    bool? parallelToolCalls,

    /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](https://platform.openai.com/docs/guides/safety-best-practices#end-user-ids).
    @JsonKey(includeIfNull: false) String? user,

    /// Deprecated in favor of `tool_choice`.
    ///
    /// Controls which (if any) function is called by the model.
    /// `none` means the model will not call a function and instead generates a message.
    /// `auto` means the model can pick between generating a message or calling a function.
    /// Specifying a particular function via [ChatCompletionFunctionCallOption] forces the model to call that
    /// function.
    ///
    /// `none` is the default when no functions are present. `auto` is the default if functions are present.
    @_ChatCompletionFunctionCallConverter()
    @JsonKey(name: 'function_call', includeIfNull: false)
    ChatCompletionFunctionCall? functionCall,

    /// Deprecated in favor of `tools`.
    ///
    /// A list of functions the model may generate JSON inputs for.
    @JsonKey(includeIfNull: false) List<FunctionObject>? functions,
  }) = _CreateChatCompletionRequest;

  /// Object construction from a JSON representation
  factory CreateChatCompletionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateChatCompletionRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'messages',
    'store',
    'metadata',
    'frequency_penalty',
    'logit_bias',
    'logprobs',
    'top_logprobs',
    'max_tokens',
    'max_completion_tokens',
    'n',
    'modalities',
    'prediction',
    'audio',
    'presence_penalty',
    'response_format',
    'seed',
    'service_tier',
    'stop',
    'stream',
    'stream_options',
    'temperature',
    'top_p',
    'tools',
    'tool_choice',
    'parallel_tool_calls',
    'user',
    'function_call',
    'functions'
  ];

  /// Validation constants
  static const frequencyPenaltyDefaultValue = 0.0;
  static const frequencyPenaltyMinValue = -2.0;
  static const frequencyPenaltyMaxValue = 2.0;
  static const topLogprobsMinValue = 0;
  static const topLogprobsMaxValue = 20;
  static const nDefaultValue = 1;
  static const nMinValue = 1;
  static const nMaxValue = 128;
  static const presencePenaltyDefaultValue = 0.0;
  static const presencePenaltyMinValue = -2.0;
  static const presencePenaltyMaxValue = 2.0;
  static const temperatureDefaultValue = 1.0;
  static const temperatureMinValue = 0.0;
  static const temperatureMaxValue = 2.0;
  static const topPDefaultValue = 1.0;
  static const topPMinValue = 0.0;
  static const topPMaxValue = 1.0;

  /// Perform validations on the schema property values
  String? validateSchema() {
    if (frequencyPenalty != null &&
        frequencyPenalty! < frequencyPenaltyMinValue) {
      return "The value of 'frequencyPenalty' cannot be < $frequencyPenaltyMinValue";
    }
    if (frequencyPenalty != null &&
        frequencyPenalty! > frequencyPenaltyMaxValue) {
      return "The value of 'frequencyPenalty' cannot be > $frequencyPenaltyMaxValue";
    }
    if (topLogprobs != null && topLogprobs! < topLogprobsMinValue) {
      return "The value of 'topLogprobs' cannot be < $topLogprobsMinValue";
    }
    if (topLogprobs != null && topLogprobs! > topLogprobsMaxValue) {
      return "The value of 'topLogprobs' cannot be > $topLogprobsMaxValue";
    }
    if (n != null && n! < nMinValue) {
      return "The value of 'n' cannot be < $nMinValue";
    }
    if (n != null && n! > nMaxValue) {
      return "The value of 'n' cannot be > $nMaxValue";
    }
    if (presencePenalty != null && presencePenalty! < presencePenaltyMinValue) {
      return "The value of 'presencePenalty' cannot be < $presencePenaltyMinValue";
    }
    if (presencePenalty != null && presencePenalty! > presencePenaltyMaxValue) {
      return "The value of 'presencePenalty' cannot be > $presencePenaltyMaxValue";
    }
    if (temperature != null && temperature! < temperatureMinValue) {
      return "The value of 'temperature' cannot be < $temperatureMinValue";
    }
    if (temperature != null && temperature! > temperatureMaxValue) {
      return "The value of 'temperature' cannot be > $temperatureMaxValue";
    }
    if (topP != null && topP! < topPMinValue) {
      return "The value of 'topP' cannot be < $topPMinValue";
    }
    if (topP != null && topP! > topPMaxValue) {
      return "The value of 'topP' cannot be > $topPMaxValue";
    }
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'messages': messages,
      'store': store,
      'metadata': metadata,
      'frequency_penalty': frequencyPenalty,
      'logit_bias': logitBias,
      'logprobs': logprobs,
      'top_logprobs': topLogprobs,
      'max_tokens': maxTokens,
      'max_completion_tokens': maxCompletionTokens,
      'n': n,
      'modalities': modalities,
      'prediction': prediction,
      'audio': audio,
      'presence_penalty': presencePenalty,
      'response_format': responseFormat,
      'seed': seed,
      'service_tier': serviceTier,
      'stop': stop,
      'stream': stream,
      'stream_options': streamOptions,
      'temperature': temperature,
      'top_p': topP,
      'tools': tools,
      'tool_choice': toolChoice,
      'parallel_tool_calls': parallelToolCalls,
      'user': user,
      'function_call': functionCall,
      'functions': functions,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionModels
// ==========================================

/// Available completion models. Mind that the list may not be exhaustive nor up-to-date.
enum ChatCompletionModels {
  @JsonValue('chatgpt-4o-latest')
  chatgpt4oLatest,
  @JsonValue('gpt-4')
  gpt4,
  @JsonValue('gpt-4-32k')
  gpt432k,
  @JsonValue('gpt-4-32k-0314')
  gpt432k0314,
  @JsonValue('gpt-4-32k-0613')
  gpt432k0613,
  @JsonValue('gpt-4-0125-preview')
  gpt40125Preview,
  @JsonValue('gpt-4-0314')
  gpt40314,
  @JsonValue('gpt-4-0613')
  gpt40613,
  @JsonValue('gpt-4-1106-preview')
  gpt41106Preview,
  @JsonValue('gpt-4-turbo')
  gpt4Turbo,
  @JsonValue('gpt-4-turbo-2024-04-09')
  gpt4Turbo20240409,
  @JsonValue('gpt-4-turbo-preview')
  gpt4TurboPreview,
  @JsonValue('gpt-4-vision-preview')
  gpt4VisionPreview,
  @JsonValue('gpt-4o')
  gpt4o,
  @JsonValue('gpt-4o-2024-05-13')
  gpt4o20240513,
  @JsonValue('gpt-4o-2024-08-06')
  gpt4o20240806,
  @JsonValue('gpt-4o-2024-11-20')
  gpt4o20241120,
  @JsonValue('gpt-4o-audio-preview')
  gpt4oAudioPreview,
  @JsonValue('gpt-4o-audio-preview-2024-10-01')
  gpt4oAudioPreview20241001,
  @JsonValue('gpt-4o-mini')
  gpt4oMini,
  @JsonValue('gpt-4o-mini-2024-07-18')
  gpt4oMini20240718,
  @JsonValue('gpt-4o-realtime-preview')
  gpt4oRealtimePreview,
  @JsonValue('gpt-4o-realtime-preview-2024-10-01')
  gpt4oRealtimePreview20241001,
  @JsonValue('gpt-3.5-turbo')
  gpt35Turbo,
  @JsonValue('gpt-3.5-turbo-16k')
  gpt35Turbo16k,
  @JsonValue('gpt-3.5-turbo-16k-0613')
  gpt35Turbo16k0613,
  @JsonValue('gpt-3.5-turbo-0125')
  gpt35Turbo0125,
  @JsonValue('gpt-3.5-turbo-0301')
  gpt35Turbo0301,
  @JsonValue('gpt-3.5-turbo-0613')
  gpt35Turbo0613,
  @JsonValue('gpt-3.5-turbo-1106')
  gpt35Turbo1106,
  @JsonValue('sonar-pro')
  sonarPro,
  @JsonValue('sonar')
  sonar,
  @JsonValue('llama-3.1-sonar-small-128k-online')
  llama31SonarSmall128kOnline,
  @JsonValue('llama-3.1-sonar-large-128k-online')
  llama31SonarLarge128kOnline,
  @JsonValue('llama-3.1-sonar-huge-128k-online')
  llama31SonarHuge128kOnline,
  @JsonValue('o1')
  o1,
  @JsonValue('o1-mini')
  o1Mini,
  @JsonValue('o1-mini-2024-09-12')
  o1Mini20240912,
  @JsonValue('o1-preview')
  o1Preview,
  @JsonValue('o1-preview-2024-09-12')
  o1Preview20240912,
}

// ==========================================
// CLASS: ChatCompletionModel
// ==========================================

/// ID of the model to use. See the [model endpoint compatibility](https://platform.openai.com/docs/models#model-endpoint-compatibility)
/// table for details on which models work with the Chat API.
@freezed
sealed class ChatCompletionModel with _$ChatCompletionModel {
  const ChatCompletionModel._();

  /// Available completion models. Mind that the list may not be exhaustive nor up-to-date.
  const factory ChatCompletionModel.model(
    ChatCompletionModels value,
  ) = ChatCompletionModelEnumeration;

  /// The ID of the model to use for this request.
  const factory ChatCompletionModel.modelId(
    String value,
  ) = ChatCompletionModelString;

  /// Object construction from a JSON representation
  factory ChatCompletionModel.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionModelFromJson(json);
}

/// Custom JSON converter for [ChatCompletionModel]
class _ChatCompletionModelConverter
    implements JsonConverter<ChatCompletionModel, Object?> {
  const _ChatCompletionModelConverter();

  @override
  ChatCompletionModel fromJson(Object? data) {
    if (data is String && _$ChatCompletionModelsEnumMap.values.contains(data)) {
      return ChatCompletionModelEnumeration(
        _$ChatCompletionModelsEnumMap.keys.elementAt(
          _$ChatCompletionModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return ChatCompletionModelString(data);
    }
    throw Exception(
      'Unexpected value for ChatCompletionModel: $data',
    );
  }

  @override
  Object? toJson(ChatCompletionModel data) {
    return switch (data) {
      ChatCompletionModelEnumeration(value: final v) =>
        _$ChatCompletionModelsEnumMap[v]!,
      ChatCompletionModelString(value: final v) => v,
    };
  }
}

// ==========================================
// ENUM: CreateChatCompletionRequestServiceTier
// ==========================================

/// Specifies the latency tier to use for processing the request. This parameter is relevant for customers
/// subscribed to the scale tier service:
///   - If set to 'auto', and the Project is Scale tier enabled, the system will utilize scale tier credits
///     until they are exhausted.
///   - If set to 'auto', and the Project is not Scale tier enabled, the request will be processed using the
///     default service tier with a lower uptime SLA and no latency guarantee.
///   - If set to 'default', the request will be processed using the default service tier with a lower uptime
///     SLA and no latency guarantee.
///   - When not set, the default behavior is 'auto'.
///
///   When this parameter is set, the response body will include the `service_tier` utilized.
enum CreateChatCompletionRequestServiceTier {
  @JsonValue('auto')
  auto,
  @JsonValue('default')
  vDefault,
}

// ==========================================
// CLASS: ChatCompletionStop
// ==========================================

/// Up to 4 sequences where the API will stop generating further tokens.
@freezed
sealed class ChatCompletionStop with _$ChatCompletionStop {
  const ChatCompletionStop._();

  /// A list of string stop sequences.
  const factory ChatCompletionStop.listString(
    List<String> value,
  ) = ChatCompletionStopListString;

  /// A string stop sequence.
  const factory ChatCompletionStop.string(
    String? value,
  ) = ChatCompletionStopString;

  /// Object construction from a JSON representation
  factory ChatCompletionStop.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionStopFromJson(json);
}

/// Custom JSON converter for [ChatCompletionStop]
class _ChatCompletionStopConverter
    implements JsonConverter<ChatCompletionStop?, Object?> {
  const _ChatCompletionStopConverter();

  @override
  ChatCompletionStop? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is List && data.every((item) => item is String)) {
      return ChatCompletionStopListString(data.cast());
    }
    if (data is String) {
      return ChatCompletionStopString(data);
    }
    throw Exception(
      'Unexpected value for ChatCompletionStop: $data',
    );
  }

  @override
  Object? toJson(ChatCompletionStop? data) {
    return switch (data) {
      ChatCompletionStopListString(value: final v) => v,
      ChatCompletionStopString(value: final v) => v,
      null => null,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionToolChoiceMode
// ==========================================

/// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
enum ChatCompletionToolChoiceMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
  @JsonValue('required')
  required,
}

// ==========================================
// CLASS: ChatCompletionToolChoiceOption
// ==========================================

/// Controls which (if any) tool is called by the model.
/// `none` means the model will not call any tool and instead generates a message.
/// `auto` means the model can pick between generating a message or calling one or more tools.
/// `required` means the model must call one or more tools.
/// Specifying a particular tool via `{"type": "function", "function": {"name": "my_function"}}` forces the
/// model to call that tool.
///
/// `none` is the default when no tools are present. `auto` is the default if tools are present.
@freezed
sealed class ChatCompletionToolChoiceOption
    with _$ChatCompletionToolChoiceOption {
  const ChatCompletionToolChoiceOption._();

  /// `none` means the model will not call any tool and instead generates a message. `auto` means the model can pick between generating a message or calling one or more tools. `required` means the model must call one or more tools.
  const factory ChatCompletionToolChoiceOption.mode(
    ChatCompletionToolChoiceMode value,
  ) = ChatCompletionToolChoiceOptionEnumeration;

  /// No Description
  const factory ChatCompletionToolChoiceOption.tool(
    ChatCompletionNamedToolChoice value,
  ) = ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice;

  /// Object construction from a JSON representation
  factory ChatCompletionToolChoiceOption.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionToolChoiceOptionFromJson(json);
}

/// Custom JSON converter for [ChatCompletionToolChoiceOption]
class _ChatCompletionToolChoiceOptionConverter
    implements JsonConverter<ChatCompletionToolChoiceOption?, Object?> {
  const _ChatCompletionToolChoiceOptionConverter();

  @override
  ChatCompletionToolChoiceOption? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$ChatCompletionToolChoiceModeEnumMap.values.contains(data)) {
      return ChatCompletionToolChoiceOptionEnumeration(
        _$ChatCompletionToolChoiceModeEnumMap.keys.elementAt(
          _$ChatCompletionToolChoiceModeEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice(
          ChatCompletionNamedToolChoice.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for ChatCompletionToolChoiceOption: $data',
    );
  }

  @override
  Object? toJson(ChatCompletionToolChoiceOption? data) {
    return switch (data) {
      ChatCompletionToolChoiceOptionEnumeration(value: final v) =>
        _$ChatCompletionToolChoiceModeEnumMap[v]!,
      ChatCompletionToolChoiceOptionChatCompletionNamedToolChoice(
        value: final v
      ) =>
        v.toJson(),
      null => null,
    };
  }
}

// ==========================================
// ENUM: ChatCompletionFunctionCallMode
// ==========================================

/// `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function.
enum ChatCompletionFunctionCallMode {
  @JsonValue('none')
  none,
  @JsonValue('auto')
  auto,
}

// ==========================================
// CLASS: ChatCompletionFunctionCall
// ==========================================

/// Deprecated in favor of `tool_choice`.
///
/// Controls which (if any) function is called by the model.
/// `none` means the model will not call a function and instead generates a message.
/// `auto` means the model can pick between generating a message or calling a function.
/// Specifying a particular function via [ChatCompletionFunctionCallOption] forces the model to call that
/// function.
///
/// `none` is the default when no functions are present. `auto` is the default if functions are present.
@freezed
sealed class ChatCompletionFunctionCall with _$ChatCompletionFunctionCall {
  const ChatCompletionFunctionCall._();

  /// `none` means the model will not call a function and instead generates a message. `auto` means the model can pick between generating a message or calling a function.
  const factory ChatCompletionFunctionCall.mode(
    ChatCompletionFunctionCallMode value,
  ) = ChatCompletionFunctionCallEnumeration;

  /// No Description
  const factory ChatCompletionFunctionCall.function(
    ChatCompletionFunctionCallOption value,
  ) = ChatCompletionFunctionCallChatCompletionFunctionCallOption;

  /// Object construction from a JSON representation
  factory ChatCompletionFunctionCall.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionFunctionCallFromJson(json);
}

/// Custom JSON converter for [ChatCompletionFunctionCall]
class _ChatCompletionFunctionCallConverter
    implements JsonConverter<ChatCompletionFunctionCall?, Object?> {
  const _ChatCompletionFunctionCallConverter();

  @override
  ChatCompletionFunctionCall? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is String &&
        _$ChatCompletionFunctionCallModeEnumMap.values.contains(data)) {
      return ChatCompletionFunctionCallEnumeration(
        _$ChatCompletionFunctionCallModeEnumMap.keys.elementAt(
          _$ChatCompletionFunctionCallModeEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is Map<String, dynamic>) {
      try {
        return ChatCompletionFunctionCallChatCompletionFunctionCallOption(
          ChatCompletionFunctionCallOption.fromJson(data),
        );
      } catch (e) {}
    }
    throw Exception(
      'Unexpected value for ChatCompletionFunctionCall: $data',
    );
  }

  @override
  Object? toJson(ChatCompletionFunctionCall? data) {
    return switch (data) {
      ChatCompletionFunctionCallEnumeration(value: final v) =>
        _$ChatCompletionFunctionCallModeEnumMap[v]!,
      ChatCompletionFunctionCallChatCompletionFunctionCallOption(
        value: final v
      ) =>
        v.toJson(),
      null => null,
    };
  }
}
