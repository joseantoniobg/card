defmodule CardTest do
  use ExUnit.Case
  doctest Card

  test "create_deck creates 20 cards" do
    deck_length = length(Card.create_deck())
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Card.create_deck()
    refute deck == Card.shuffle(deck)
  end
end
