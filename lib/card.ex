defmodule Card do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  @doc """
    Returns a lists of strings representing the playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # cards =
    #   for suit <- suits do
    #     for value <- values do
    #       "#{value} of #{suit}"
    #     end
    #   end

    # List.flatten(cards)
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contais a given card
  ## Examples

      iex> deck = Card.create_deck
      iex> Card.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. The `hand_size` argument indicates how many cards should be in the hand

  ## Examples

      iex> deck = Card.create_deck
      iex> {hand, deck} = Card.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # {status, binary} = File.read(filename)
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    # deck = Card.create_deck()
    # deck = Card.shuffle(deck)
    # hand = Card.deal(deck, hand_size)

    Card.create_deck()
    |> Card.shuffle()
    |> Card.deal(hand_size)
  end
end
