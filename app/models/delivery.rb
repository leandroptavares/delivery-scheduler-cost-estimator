class Delivery < ApplicationRecord
  validates :pickup_address, presence: true
  validates :delivery_address, presence: true
  validate :pickup_and_delivery_addresses_must_differ
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :distance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :scheduled_time, presence: true
  validate :scheduled_time_must_be_in_future
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :calculate_distance
  before_validation :calculate_cost

  private

  # Custom validation for pickup_address and delivery_address
  def pickup_and_delivery_addresses_must_differ
    errors.add(:delivery_address, "cannot be the same as pickup address") if pickup_address == delivery_address
  end

  # Custom validation for scheduled_time
  def scheduled_time_must_be_in_future
    if scheduled_time.present? && scheduled_time < 1.day.from_now.beginning_of_day
      errors.add(:scheduled_time, "must be greater than the current date")
    end
  end

  # Method to automatically calculate the cost based on distance and weight
  def calculate_cost
    if distance.present? && weight.present?
      base_cost = 5
      rate_per_km = 0.5
      rate_per_kg = 1
      self.cost = base_cost + ((distance * rate_per_km) + (weight * rate_per_kg))
    end
  end

  # Methods to automatically calculate the distance (in km) based on pickup_address and delivery_address
  def calculate_distance
    if pickup_address.present? && delivery_address.present?
      pickup_address_coord = get_address_coordinates(pickup_address)
      delivery_address_coord = get_address_coordinates(delivery_address)
      self.distance = get_addresses_distance(pickup_address_coord, delivery_address_coord)
    end
  end

  def get_address_coordinates(address)
    url = "https://api.mapbox.com/search/geocode/v6/forward?q=#{address}&proximity=ip&access_token=#{ENV['MAPBOX_KEY']}"

    response = HTTP.get(url)

    if response.status.success?
      geocode_data = response.parse(:json)
      if geocode_data["features"].any?
        return geocode_data["features"].first["geometry"]["coordinates"]
      end
    end
  end

  def get_addresses_distance(first_address_coord, second_address_coord)

    first_address_coord_str = "#{first_address_coord[0]},#{first_address_coord[1]}"
    second_address_coord_str = "#{second_address_coord[0]},#{second_address_coord[1]}"

    url = "https://api.mapbox.com/directions/v5/mapbox/driving/#{first_address_coord_str}%3B#{second_address_coord_str}?alternatives=false&annotations=distance&geometries=geojson&language=en&overview=full&steps=true&access_token=#{ENV['MAPBOX_KEY']}"

    response = HTTP.get(url)

    if response.status.success?
      distance_in_meters = response.parse(:json)["routes"].first["distance"]
      return (distance_in_meters / 1000.0).round(1)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["pickup_address", "driver_name"]
  end

end
