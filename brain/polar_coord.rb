class PolarCoord
  attr_accessor :h, :y, :t, :a, :b

  def set_from_user_coord_and_t(coord, t)
    @y = coord.y; @t = t; @a = coord.angle - t; @b = coord.b

    elbow_x = coord.x + Math.sin(coord.angle / 180.0 * Math::PI) * Globals::HUMERUS_LENGTH
    @h = elbow_x - (Math.sin(t / 180.0 * Math::PI) * Globals::HUMERUS_LENGTH)

    self
  end

  def set_from_user_coord(coord)
    # Given the ending position and angle of the forearm, we can
    # calculate the position of the elbow.
    dz = Math.cos(coord.angle / 180.0 * Math::PI) * Globals::FOREARM_GRIP_LENGTH
    elbow_z = coord.z - dz # WHYYY minus??? Seems to work...
    
    # There are then 2 positions possible for the trolley.
    # Also, maybe it is impossible for the arm to be get
    # at this position with this angle.
    # begin
    _t = Math.acos((Globals::TROLLEY_Z - elbow_z)/Globals::HUMERUS_LENGTH)*180.0/Math::PI
    # rescue Math::DomainError
    # end

    # return the first valid solution
    set_from_user_coord_and_t(coord, -_t)
    if invalid_destination()
      set_from_user_coord_and_t(coord, _t)
    end

    self
  end

  def invalid_destination()
    false
  end

  def to_s
    "(#{@h},#{@y},#{@t},#{@a},#{@b})"
  end
end
