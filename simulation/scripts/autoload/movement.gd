extends Node

func calculate_best_angle():
	pass

# The minimum angle that the arm get have to the to this coord.
#  def min_angle(coord, step=0.5)
#    (-180.0..180.0).step(step) do |a|
#      polar = polar_coord_for_angle(coord, a, false)
#      return a if polar and not invalid_destination(polar)
#    end
#    nil
#  end
# The maximum angle that the arm get have to the to this coord.
#  def max_angle(coord, step=0.5)
#    (-180.0..180.0).step(step) do |a|
#      polar = polar_coord_for_angle(coord, -a, false)
#      return -a if polar and not invalid_destination(polar)
#    end
#    nil
#  end
#
#  def polar_coord_for_angle_and_t(coord, angle, t, radius)
#    a = angle - t
#
#    elbow_with_offset_x = coord.x + Math.sin(angle / 180.0 * Math::PI) * radius
#    elbow_x = elbow_with_offset_x - Math.sin((angle+90.0) / 180.0 * Math::PI) * CONST.gripper_side_offset
#    h = elbow_x + (Math.sin(t / 180.0 * Math::PI) * CONST.alpha_radius)
#
#    PolarCoord.new(h, coord.y, t, a, coord.b)
#  end
#
#  def t_for_z(z, angle, radius, required=true)
#    elbow_z = z + Math.cos(angle / 180.0 * Math::PI) * radius
#    val = (CONST.carriage_offset - elbow_z)/CONST.alpha_radius
#    if val < -1.0 or val > 1.0
#      #puts "Carriage at #{CONST.carriage_offset}, Destination z at #{z}, Requested angle is #{angle} so elbow must be at z #{elbow_z}".red
#      raise "Impossible t_for_z z=#{z}, angle=#{angle}, out of domain acos" if required
#      return nil
#    end
#    t = Math.acos(val) * 180.0 / Math::PI
#  end
# Specify the angle that the forearm will be in. (a+t)
  # There are two possible solutions.
#  def polar_coord_for_angle(coord, angle, required=true)

	#elbow_with_offset_z = coord.z + Math.cos(angle / 180.0 * Math::PI) * CONST.gripper_radius
	#elbow_z_with_offset = CONST.user_coord_offset_z -
	#  Math.cos(t / 180.0 * Math::PI) * CONST.alpha_radius -
	#  Math.sin(t / 180.0 * Math::PI) * CONST.gripper_side_offset


	#elbow_z_with_offset = elbow_z - Math.sin(t / 180.0 * Math::PI) * CONST.gripper_side_offset
	#elbow_z = CONST.user_coord_offset_z - (Math.cos(t / 180.0 * Math::PI) * CONST.alpha_radius)

	
	
	#elbow_with_offset_z = coord.z + Math.cos(angle / 180.0 * Math::PI) * CONST.gripper_radius
	#elbow_z = elbow_with_offset_z - Math.cos((angle+90.0) / 180.0 * Math::PI) * CONST.gripper_side_offset
#	radius = CONST.gripper_radius
	#if @gripped_object and @gripped_object.respond_to?(:content_offset)
	#  puts "The arm is gripping an object, so using it's content offset."
	#  radius += @gripped_object.content_offset + CONST.tip_offset
	#end

#	t = t_for_z(coord.z, angle, radius, required)
#	coord.errors << "Can't get coord for angle #{angle}, t_for_z is nil.".red unless t
#	return nil if t.nil?
	# acos gives two possible values, t and -t
	# TODO: Find a smart way to decide which value to use
	# It was causing me some issue for unscrew, because it would switch
	# in the middle of unscrew and that would move the whole arm to get in the good position
	# so I inverted t and -t to -t and t
#	p = polar_coord_for_angle_and_t(coord, angle, -t, radius)
#	if invalid_destination(p)
#	  p = polar_coord_for_angle_and_t(coord, angle, t, radius) 
#	end
#
#	test = Arm.new
#	test.h = p.h
#	test.t = p.t
#	test.a = p.a
	#logger.info "angle: #{angle}"
	#logger.info "coord is at: #{coord.x}, #{coord.z}"
	#logger.info "gripper is at: #{test.gripper_x}, #{test.gripper_z}"
	#logger.info "gripper is at: #{h}, #{a}, #{t}"
	#unless (test.gripper_x - coord.x).abs < 0.001 and (test.gripper_z - coord.z).abs < 0.001
	#  raise "WARNING: Impossible to_gripper_polar_coord_angle, calculation error, not the same"
	#end

#	coord.errors << "No valid to_gripper_polar_coord_angle found at angle #{angle}.".red unless p
#	raise "No valid to_gripper_polar_coord_angle found" if required && !p
#	p
#  end
#
#  def bruteforce_pathfinding(coord)
#    verbose = true
#
#    angles = (-135.0..135.0) # FIXME: Hardcoded
#    possibilities = []
#    angles.step(5.0) do |angle|
#
#      coord.errors.clear
#
#      polar = polar_coord_for_angle(coord, angle, false)
#      if polar and not invalid_destination(polar)
#        score = path_score(self, polar)
#        #heda_log "Angle: #{angle}, score: #{score}"
#        possibilities << ({angle: angle, polar: polar, score: score}) 
#      end
#
#      puts coord.errors if verbose && !polar
#      puts polar.errors if verbose && polar && polar.errors
#    end
#    puts "Found #{possibilities.size} possibilities."
#    if possibilities.blank?
#      puts "****************** INVALID BRUTEFORCE! ***************************".red
#      t = t_for_z(coord.z, 0.0, CONST.gripper_radius, true)
#      return polar_coord_for_angle_and_t(coord, 0.0, t, CONST.gripper_radius)
#    end
#    sorted = possibilities.sort_by {|p| p[:score]}
#    puts "Best possibility at angle #{sorted.first[:angle]}."
#    sorted.first[:polar]
#  end
