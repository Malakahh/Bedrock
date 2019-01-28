data:extend({
	{
		type = "int-setting",
		name = "bedrock-starting-area-width",
		setting_type = "runtime-global",
		default_value = 128,
		minimum_value = 16,
		maximum_value = 512,
		order = "sa-01"
	},
	{
		type = "int-setting",
		name = "bedrock-starting-area-height",
		setting_type = "runtime-global",
		default_value = 128,
		minimum_value = 16,
		maximum_value = 512,
		order = "sa-02"
	},
	{
		type = "double-setting",
		name = "bedrock-cave-level",
		setting_type = "runtime-global",
		default_value = 0.25,
		minimum_value = -1.0,
		maximum_value = 1.0,
		order = "l-01"
	},
	{
		type = "double-setting",
		name = "bedrock-resource-level",
		setting_type = "runtime-global",
		default_value = -0.6,
		minimum_value = -1.0,
		maximum_value = 1.0,
		order = "l-02"
	},
	{
		type = "int-setting",
		name = "bedrock-noise-period",
		setting_type = "runtime-global",
		default_value = 128,
		minimum_value = 1,
		maximum_value = 1000,
		order = "n-01"
	},
	{
		type = "int-setting",
		name = "bedrock-noise-octaves",
		setting_type = "runtime-global",
		default_value = 5,
		minimum_value = 1,
		maximum_value = 8,
		order = "n-02"
	},
	{
		type = "int-setting",
		name = "bedrock-noise-persistence",
		setting_type = "runtime-global",
		default_value = 150,
		minimum_value = 1,
		maximum_value = 1000,
		order = "n-03"
	}
})
