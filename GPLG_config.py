import os
import re

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

GNOME_DATA = os.path.join(BASE_DIR, "scripts", "GPLG_data.lua")
MODINFO = os.path.join(BASE_DIR, "modinfo.lua")
STRINGS = os.path.join(BASE_DIR, "scripts", "gnomes_strings", "strings.lua")

START_MARKER = "-- AUTO-GENERATED GNOME CONFIGS START"
END_MARKER = "-- AUTO-GENERATED GNOME CONFIGS END"

# Gather gnome data

def GetGnomeNames(lua_text):
	names = {}
	
	for key, name in re.findall(r'NAMES\.(\w+)\s*=\s*"([^"]+)"', lua_text):
		names[key.upper()] = name
	
	return names

def GetGnomes(data, names):
	gnomes = []
	
	for key, content in re.findall(r'\["([^"]+)"\]\s*=\s*{([^}]*)}', data):
		# Label
		lookup_key = key.upper()
		label = names.get(lookup_key, key)
		
		# Default
		chance_match = re.search(r'default\s*=\s*(\d+)', content)
		default = int(chance_match.group(1)) if chance_match else 10
		
		# Type
		type_match = re.search(r'type\s*=\s*"(\w+)"', content)
		options_type = type_match.group(1) if type_match else "chance"
		
		# Optional overrides
		config_match = re.search(r'config\s*=\s*"(\w+)"', content)
		desc_match = re.search(r'desc\s*=\s*"(\w+)"', content)
		options_match = re.search(r'options\s*=\s*"(\w+)"', content)
		
		config_key = config_match.group(1) if config_match else "chance"
		desc_key = desc_match.group(1) if desc_match else "chance"
		optionsion_key = options_match.group(1) if options_match else options_type
		
		gnomes.append({
			"key": key,
			"label": label,
			"default": default,
			"type": options_type,
			"config": config_key,
			"desc": desc_key,
			"options": optionsion_key
		})
		
	return sorted(gnomes, key=lambda x: x["key"])

# Generate config entries

def GenerateConfigs(gnomes):
	lines = []
	
	for g in gnomes:
		key = g["key"]
		label = g["label"]
		default = g["default"]
		options_type = g["type"]
		
		# Header
		lines.append(f'\t{{name = "{key}", label = "{label}", options = options.none, default = false}},')
		
		# Config
		lines.append(
			f'\t{{name = "chance_{key}", '
			f'label = configs.{g["config"]}, '
			f'hover = descs.{g["desc"]}, '
			f'options = options.{g["options"]}, '
			f'default = {default}}},'
		)
		
		lines.append("")
		
	return "\n".join(lines)

# Insert configs

def Inject(text, new_content):
	pattern = re.escape(START_MARKER) + r"(.*?)" + re.escape(END_MARKER)
	
	match = re.search(pattern, text, re.DOTALL)
	if not match:
		raise Exception("Markers not found :(")
	
	return re.sub(pattern, START_MARKER + "\n" + new_content + "\n\t" + END_MARKER, text, flags=re.DOTALL)

# Main

def main():
	try:
		with open(STRINGS, "r", encoding="utf-8") as f:
			strings_text = f.read()
		
		names = GetGnomeNames(strings_text)
		
		with open(GNOME_DATA, "r", encoding="utf-8") as f:
			data_text = f.read()
		
		with open(MODINFO, "r", encoding="utf-8") as f:
			modinfo_text = f.read()
		
		gnomes = GetGnomes(data_text, names)
		entries = GenerateConfigs(gnomes)
		updated = Inject(modinfo_text, entries)
		
		with open(MODINFO, "w", encoding="utf-8") as f:
			f.write(updated)
		
		print(f"Generated {len(gnomes)} gnome configs !")
		
	except Exception as e:
		print("Couldn't generate configs :", e)
	
	input("\nPress enter to exit...")
	
main()