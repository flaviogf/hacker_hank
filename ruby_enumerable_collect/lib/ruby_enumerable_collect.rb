# frozen_string_literal: true

module RubyEnumerableCollect
  class << self
    def execute(secret_messages)
      secret_messages.collect(&method(:decode))
    end

    private

    def decode(secret_message)
      secret_message.split('').collect(&method(:rot)).join
    end

    def rot(letter)
      index = alphabet.find_index(letter)

      return letter if index.nil?

      index += 13

      index -= 26 if index >= 26

      alphabet[index]
    end

    def alphabet
      @alphabet ||= ('a'..'z').to_a
    end
  end
end
