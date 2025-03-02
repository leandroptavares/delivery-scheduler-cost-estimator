require "test_helper"

class DeliveryTest < ActiveSupport::TestCase
  def setup
    @delivery = Delivery.new(
      pickup_address: "Portsmuiden 58, Amsterdam, North Holland, 1046 AH",
      delivery_address: "Coolsingel 1, Rotterdam, South Holland, 3012 AG",
      weight: 10,
      scheduled_time: (Time.zone.now + 2.days).strftime("%Y-%m-%d %H:00"),
    )

    @delivery.valid?
  end

  test "valid delivery should be saved" do
    assert @delivery.valid?
    assert @delivery.save
  end

  test "should not save delivery without pickup address" do
    @delivery.pickup_address = nil
    assert_not @delivery.valid?
    assert_includes @delivery.errors[:pickup_address], "can't be blank"
  end

  test "should not save delivery without delivery address" do
    @delivery.delivery_address = nil
    assert_not @delivery.valid?
    assert_includes @delivery.errors[:delivery_address], "can't be blank"
  end

  test "should not allow same pickup and delivery addresses" do
    @delivery.delivery_address = @delivery.pickup_address
    assert_not @delivery.valid?
    assert_includes @delivery.errors[:delivery_address], "cannot be the same as pickup address"
  end

  test "should not save delivery without weight" do
    @delivery.weight = nil
    assert_not @delivery.valid?
    assert_includes @delivery.errors[:weight], "can't be blank"
  end

  test "should not allow weight less than or equal to zero" do
    @delivery.weight = 0
    assert_not @delivery.valid?
    assert_includes @delivery.errors[:weight], "must be greater than 0"
  end

  test "should calculate distance and not be negative" do
    @delivery.valid?
    assert_not_nil @delivery.distance, "Distance should be calculated and not nil"
    assert @delivery.distance >= 0, "Distance should not be negative"
  end

  test "should not save delivery without scheduled time" do
    @delivery.scheduled_time = nil
    assert_not @delivery.valid?
    assert_includes @delivery.errors[:scheduled_time], "can't be blank"
  end

  test "should not allow scheduled time in the past or today" do
    @delivery.scheduled_time = (Time.zone.now - 1.day).strftime("%Y-%m-%d %H:00")
    assert_not @delivery.valid?
    assert_includes @delivery.errors[:scheduled_time], "must be greater than the current date"
  end

  test "should allow scheduled time in the future" do
    @delivery.scheduled_time = (Time.zone.now + 3.days).strftime("%Y-%m-%d %H:00")
    assert @delivery.valid?
  end

  test "should calculate cost and not be negative" do
    @delivery.valid?
    assert_not_nil @delivery.cost, "Cost should be calculated and not nil"
    assert @delivery.cost >= 0, "Cost should not be negative"
  end

  test "should calculate cost correctly" do
    @delivery.valid?
    assert @delivery.distance.present?, "Expected distance to be calculated"
    assert @delivery.cost.present?, "Expected cost to be calculated"

    expected_cost = 5 + ((@delivery.distance * 0.5) + (@delivery.weight * 1))
    assert_equal expected_cost, @delivery.cost
  end

  test "should calculate distance correctly" do
    @delivery.valid?
    expected_distance_range = (65..75)
    assert expected_distance_range.include?(@delivery.distance),
      "Expected distance to be within #{expected_distance_range}, but got #{@delivery.distance}"
  end
end
