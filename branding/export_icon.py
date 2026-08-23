from pathlib import Path
from PIL import Image

root = Path(__file__).resolve().parents[1]
source = root / "branding" / "icon" / "source" / "wamda_icon.png"
image = Image.open(source).convert("RGBA")
if image.width < 1024 or image.height < 1024 or image.width != image.height:
    raise SystemExit(f"Source must be square and at least 1024px: {image.size}")

sizes = {"mdpi": 48, "hdpi": 72, "xhdpi": 96, "xxhdpi": 144, "xxxhdpi": 192}
for density, size in sizes.items():
    target = root / "android" / "app" / "src" / "main" / "res" / f"mipmap-{density}"
    target.mkdir(parents=True, exist_ok=True)
    image.resize((size, size), Image.Resampling.LANCZOS).save(target / "ic_launcher.png", "PNG", optimize=True)

ios_dir = root / "ios" / "Runner" / "Assets.xcassets" / "AppIcon.appiconset"
ios_sizes = {
    "Icon-App-20x20@1x.png": 20, "Icon-App-20x20@2x.png": 40, "Icon-App-20x20@3x.png": 60,
    "Icon-App-29x29@1x.png": 29, "Icon-App-29x29@2x.png": 58, "Icon-App-29x29@3x.png": 87,
    "Icon-App-40x40@1x.png": 40, "Icon-App-40x40@2x.png": 80, "Icon-App-40x40@3x.png": 120,
    "Icon-App-60x60@2x.png": 120, "Icon-App-60x60@3x.png": 180,
    "Icon-App-76x76@1x.png": 76, "Icon-App-76x76@2x.png": 152,
    "Icon-App-83.5x83.5@2x.png": 167, "Icon-App-1024x1024@1x.png": 1024,
}
if ios_dir.is_dir():
    for name, size in ios_sizes.items():
        image.resize((size, size), Image.Resampling.LANCZOS).save(ios_dir / name, "PNG", optimize=True)
