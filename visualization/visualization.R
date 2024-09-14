
# General syntax ---------------------------------------------------------------
#ggplot (data = <DATA> ) +
#  <GEOM_FUNCTION> (mapping = aes( <MAPPINGS> ),
#                   stat = <STAT> , position = <POSITION> ) +
#  <COORDINATE_FUNCTION> +
#  <FACET_FUNCTION> +
#  <SCALE_FUNCTION> +
#  <THEME_FUNCTION>

# Plot climate data ------------------------------------------------------------
ggplot() + 
  geom_line(aes(x = xval, y = yval)) +
  geom_point(aes(x = xval, y = yval))

