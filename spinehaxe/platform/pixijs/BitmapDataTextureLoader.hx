package spinehaxe.platform.pixijs;

import pixi.core.math.shapes.Rectangle;
import pixi.core.textures.Texture;
import spinehaxe.Exception.IllegalArgumentException;
import spinehaxe.atlas.AtlasPage;
import spinehaxe.atlas.AtlasRegion;
import spinehaxe.atlas.TextureLoader;
import spinehaxe.platform.pixijs.PixiSpineTexture;

class BitmapDataTextureLoader implements TextureLoader {
	var loaderResources: Dynamic;

	public function new(loaderResources: Dynamic) {
		this.loaderResources = loaderResources;
	}

	public function loadPage (page:AtlasPage, path:String) : Void {
		
		path = ~/-/g.replace(path, '_');
		
		var texture: Texture = Reflect.field(loaderResources, path.substring(0, path.lastIndexOf('.'))).texture;
		page.rendererObject = texture;
		page.width = Std.int(texture.width);
		page.height = Std.int(texture.height);
		
		// pixi.core.display.Texture

		// var bitmapData:BitmapData = Assets.getBitmapData(prefix + path);
		// if (bitmapData == null)
		// 	throw new IllegalArgumentException("BitmapData not found with name: " + prefix + path);
		// page.rendererObject = bitmapData;
		// page.width = bitmapData.width;
		// page.height = bitmapData.height;
	}

	public function loadRegion (region:AtlasRegion) : Void {
		var frame = new Rectangle(region.x, region.y, region.width, region.height);
		trace(frame);
		region.rendererObject = new Texture(region.page.rendererObject, frame, null, region.rotate);
	}

	public function unloadPage (page:AtlasPage) : Void {
		page.rendererObject.destroy();
	}

	public function loadTexture(textureFile:String, format, useMipMaps): spinehaxe.atlas.Texture {
		textureFile = ~/-/g.replace(textureFile, '_');
		var texture: Texture = Reflect.field(loaderResources, textureFile.substring(0, textureFile.lastIndexOf('.'))).texture;
		return new PixiSpineTexture(texture);
	}
}
