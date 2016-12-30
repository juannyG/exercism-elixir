defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @seconds_in_a_year_on_earth 31_557_600

  @mercury_orbital_period_relative_to_earth 0.2408467
  @venus_orbital_period_relative_to_earth 0.61519726
  @mars_orbital_period_relative_to_earth 1.8808158
  @jupiter_orbital_period_relative_to_earth 11.862615
  @saturn_orbital_period_relative_to_earth 29.447498
  @uranus_orbital_period_relative_to_earth 84.016846
  @neptune_orbital_period_relative_to_earth 164.79132


  @orbital_periods_in_seconds_of_planets %{
    earth: @seconds_in_a_year_on_earth,
    mercury: @seconds_in_a_year_on_earth * @mercury_orbital_period_relative_to_earth,
    venus: @seconds_in_a_year_on_earth * @venus_orbital_period_relative_to_earth,
    mars: @seconds_in_a_year_on_earth * @mars_orbital_period_relative_to_earth,
    jupiter: @seconds_in_a_year_on_earth * @jupiter_orbital_period_relative_to_earth,
    saturn: @seconds_in_a_year_on_earth * @saturn_orbital_period_relative_to_earth,
    uranus: @seconds_in_a_year_on_earth * @uranus_orbital_period_relative_to_earth,
    neptune: @seconds_in_a_year_on_earth * @neptune_orbital_period_relative_to_earth
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @orbital_periods_in_seconds_of_planets[planet]
  end
end
