package spinehaxe.platform.pixijs;
import spinehaxe.atlas.Texture;


class PixiSpineTexture implements Texture {
	public var width(get, never):Int;
	public var height(get, never):Int;
	
	public var texture: pixi.core.textures.Texture;

	public function new(texture: pixi.core.textures.Texture) {
		this.texture = texture;
	}
	public function get_width():Int {

		return Std.int(texture.width);
	}
	public function get_height():Int {
		return Std.int(texture.height);
	}
	public function dispose():Void {
		// todo check what else is to do in texture.destroy()
		texture.destroy();
	}
	public function setWrap(uWrap, vWrap):Void {  }
	public function setFilter(minFilter, magFilter):Void {  }
}
