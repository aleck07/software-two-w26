class Radar
  def initialize(radar_id, params)
    @radar_id = radar_id
    @params = params
  end

  def position
    [@radar_id, @params[:latitude], @params[:longitude]]
  end

  # ... more methods ...
end

radar_params = {
  # AI generated parameters cus why not 
  latitude: 44.04316,
  longitude: -121.33400,
  altitude_meters: 1135,
  sweep_angle_degrees: 120,
  sweep_speed_rpm: 6.5,
  max_range_km: 100,
  min_range_km: 1.2,
  transmit_power_watts: 2500,
  frequency_mhz: 9350,
  pulse_width_microseconds: 1.2,
  pulse_repetition_frequency: 1200,
  antenna_diameter_meters: 3.4,
  beam_width_degrees: 1.8,
  is_mobile: false,
  rotation_offset_degrees: 15,
  operating_mode: "search",
  detection_threshold: 0.72,
  clutter_filter_enabled: true,
  doppler_processing_enabled: true,
  max_targets: 250,
  update_rate_hz: 2.5,
  calibration_date: "2025-11-03",
  manufacturer: "Northwind Systems",
  model_number: 3263827,
  installation_date: "2024-07-18",
  maintenance_interval_hours: 720,
  weather_resistant: true,
  encryption_enabled: false
}

r = Radar.new(2, radar_params)

pp r.position

# The radar_id isn't included in the parameters because the radar_id is the unique identifier, so it makes more sense to have it directly in the class.
# I think parameters that are never going to change about the radar should be in the class, such as the longitude and latitude. 