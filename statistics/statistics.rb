#
# 偏差積: deviation product
# 共分散:  covariance
# 相関係数: correlational coefficient
# 偏相関係数: partial correlational coefficient


# X,Yの
# 偏相関係数 = (XとYの相関係数)-(XとZの相関係数)*(YとZの相関係数)^2 / (sqrt(1-(XとZの相関係数)))*(sqrt(1-(YとZの相関係数)))
#


def get_soukan_keisuu(array_1, array_2)
  # TODO
end

def get_partial_correlation_coefficient(cc_xy, cc_yz, cc_zx)
  # TODO: なにやってるかわからんくなった .. .
  # partial_correlation_coefficient = c
end

# Main Program
array_x = [1, 3, 3, 4, 5, 5, 5, 6, 8, 10]  # bank count
array_y = [30, 61, 80, 120, 130, 120, 133, 140, 160, 199]  # restaurant count
array_z = [1200, 3000, 3200, 4000, 5000, 6000, 7000, 8000, 9000, 10000]  # population


cc_xy = get_correlation_coefficient(array_x, array_y)
cc_yz = get_correlation_coefficient(array_y, array_z)
cc_zx = get_correlation_coefficient(array_z, array_x)
puts "cc_xy=#{cc_xy}"
puts "cc_yz=#{cc_yz}"
puts "cc_zx=#{cc_zx}"


pcc_xy = get_partial_correlation_coefficient(cc_xy, cc_yz, cc_zx)
puts "pcc_xy=#{pcc_xy}"



if pcc_xy <= -0.95:
  puts "pcc_xy has strong Negative relation!"
elsif pcc_xy >= 0.95:
  puts "pcc_xy has strong Positive relation!"
else:
  puts "pcc_xy has no strong relation becuase pcc_xy=#{pcc_xy}"
end
