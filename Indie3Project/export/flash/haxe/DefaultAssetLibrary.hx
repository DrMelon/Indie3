package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(flash.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/indie3.tmx", __ASSET__assets_data_indie3_tmx);
		type.set ("assets/data/indie3.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/test.tmx", __ASSET__assets_data_test_tmx);
		type.set ("assets/data/test.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/all_anim.png", __ASSET__assets_images_all_anim_png);
		type.set ("assets/images/all_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/bloodparticle.png", __ASSET__assets_images_bloodparticle_png);
		type.set ("assets/images/bloodparticle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/bwbeb.png", __ASSET__assets_images_bwbeb_png);
		type.set ("assets/images/bwbeb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/dube.png", __ASSET__assets_images_dube_png);
		type.set ("assets/images/dube.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/enemy.png", __ASSET__assets_images_enemy_png);
		type.set ("assets/images/enemy.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/explod.png", __ASSET__assets_images_explod_png);
		type.set ("assets/images/explod.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/idle_anim.png", __ASSET__assets_images_idle_anim_png);
		type.set ("assets/images/idle_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/indie3 enemies.png", __ASSET__assets_images_indie3_enemies_png);
		type.set ("assets/images/indie3 enemies.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/indie3 jam stuff.png", __ASSET__assets_images_indie3_jam_stuff_png);
		type.set ("assets/images/indie3 jam stuff.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/indie3 tileset copy.png", __ASSET__assets_images_indie3_tileset_copy_png);
		type.set ("assets/images/indie3 tileset copy.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/jump_anim.png", __ASSET__assets_images_jump_anim_png);
		type.set ("assets/images/jump_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/placeholder2.png", __ASSET__assets_images_placeholder2_png);
		type.set ("assets/images/placeholder2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/placeholder_player.png", __ASSET__assets_images_placeholder_player_png);
		type.set ("assets/images/placeholder_player.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/run_anim.png", __ASSET__assets_images_run_anim_png);
		type.set ("assets/images/run_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/shots.png", __ASSET__assets_images_shots_png);
		type.set ("assets/images/shots.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/shots_blaster.png", __ASSET__assets_images_shots_blaster_png);
		type.set ("assets/images/shots_blaster.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/shots_blaster_old.png", __ASSET__assets_images_shots_blaster_old_png);
		type.set ("assets/images/shots_blaster_old.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/music/ingame.mp3", __ASSET__assets_music_ingame_mp3);
		type.set ("assets/music/ingame.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sounds/bass/BAP.wav", __ASSET__assets_sounds_bass_bap_wav);
		type.set ("assets/sounds/bass/BAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/BIP.wav", __ASSET__assets_sounds_bass_bip_wav);
		type.set ("assets/sounds/bass/BIP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/ded.wav", __ASSET__assets_sounds_bass_ded_wav);
		type.set ("assets/sounds/bass/ded.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/JIMPJUMP.wav", __ASSET__assets_sounds_bass_jimpjump_wav);
		type.set ("assets/sounds/bass/JIMPJUMP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/SCHWAP.wav", __ASSET__assets_sounds_bass_schwap_wav);
		type.set ("assets/sounds/bass/SCHWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/SHAA.wav", __ASSET__assets_sounds_bass_shaa_wav);
		type.set ("assets/sounds/bass/SHAA.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/SPLOO.wav", __ASSET__assets_sounds_bass_sploo_wav);
		type.set ("assets/sounds/bass/SPLOO.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/WOAAAAAAAAAAH.wav", __ASSET__assets_sounds_bass_woaaaaaaaaaah_wav);
		type.set ("assets/sounds/bass/WOAAAAAAAAAAH.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/ZWAP.wav", __ASSET__assets_sounds_bass_zwap_wav);
		type.set ("assets/sounds/bass/ZWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/bass/ZWOOP.wav", __ASSET__assets_sounds_bass_zwoop_wav);
		type.set ("assets/sounds/bass/ZWOOP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/BAP.wav", __ASSET__assets_sounds_indie3jammusix_bap_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/BAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/BIP.wav", __ASSET__assets_sounds_indie3jammusix_bip_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/BIP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/JIMPJUMP.wav", __ASSET__assets_sounds_indie3jammusix_jimpjump_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/JIMPJUMP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/SCHWAP.wav", __ASSET__assets_sounds_indie3jammusix_schwap_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SCHWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/SHAA.wav", __ASSET__assets_sounds_indie3jammusix_shaa_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SHAA.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/SPLOO.wav", __ASSET__assets_sounds_indie3jammusix_sploo_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SPLOO.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/SWOOSWOOSWO.wav", __ASSET__assets_sounds_indie3jammusix_swooswooswo_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SWOOSWOOSWO.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/WOAAAAAAAAAAH.wav", __ASSET__assets_sounds_indie3jammusix_woaaaaaaaaaah_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/WOAAAAAAAAAAH.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/ZWAP.wav", __ASSET__assets_sounds_indie3jammusix_zwap_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/ZWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Indie3JAMMUSIX/ZWOOP.wav", __ASSET__assets_sounds_indie3jammusix_zwoop_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/ZWOOP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/tiled/indie3-background.gif", __ASSET__assets_tiled_indie3_background_gif);
		type.set ("assets/tiled/indie3-background.gif", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/indie3_tileset.png", __ASSET__assets_tiled_indie3_tileset_png);
		type.set ("assets/tiled/indie3_tileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/indie3_tilesetold.png", __ASSET__assets_tiled_indie3_tilesetold_png);
		type.set ("assets/tiled/indie3_tilesetold.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/tiled/tiles.png", __ASSET__assets_tiled_tiles_png);
		type.set ("assets/tiled/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#elseif html5
		
		addExternal("assets/data/data-goes-here.txt", "text", "assets/data/data-goes-here.txt");
		addExternal("assets/data/indie3.tmx", "text", "assets/data/indie3.tmx");
		addExternal("assets/data/test.tmx", "text", "assets/data/test.tmx");
		addExternal("assets/images/all_anim.png", "image", "assets/images/all_anim.png");
		addExternal("assets/images/bg.png", "image", "assets/images/bg.png");
		addExternal("assets/images/bloodparticle.png", "image", "assets/images/bloodparticle.png");
		addExternal("assets/images/bwbeb.png", "image", "assets/images/bwbeb.png");
		addExternal("assets/images/dube.png", "image", "assets/images/dube.png");
		addExternal("assets/images/enemy.png", "image", "assets/images/enemy.png");
		addExternal("assets/images/explod.png", "image", "assets/images/explod.png");
		addExternal("assets/images/idle_anim.png", "image", "assets/images/idle_anim.png");
		addExternal("assets/images/images-go-here.txt", "text", "assets/images/images-go-here.txt");
		addExternal("assets/images/indie3 enemies.png", "image", "assets/images/indie3 enemies.png");
		addExternal("assets/images/indie3 jam stuff.png", "image", "assets/images/indie3 jam stuff.png");
		addExternal("assets/images/indie3 tileset copy.png", "image", "assets/images/indie3 tileset copy.png");
		addExternal("assets/images/jump_anim.png", "image", "assets/images/jump_anim.png");
		addExternal("assets/images/placeholder2.png", "image", "assets/images/placeholder2.png");
		addExternal("assets/images/placeholder_player.png", "image", "assets/images/placeholder_player.png");
		addExternal("assets/images/run_anim.png", "image", "assets/images/run_anim.png");
		addExternal("assets/images/shots.png", "image", "assets/images/shots.png");
		addExternal("assets/images/shots_blaster.png", "image", "assets/images/shots_blaster.png");
		addExternal("assets/images/shots_blaster_old.png", "image", "assets/images/shots_blaster_old.png");
		addExternal("assets/music/ingame.mp3", "music", "assets/music/ingame.mp3");
		addExternal("assets/music/music-goes-here.txt", "text", "assets/music/music-goes-here.txt");
		addExternal("assets/sounds/bass/BAP.wav", "sound", "assets/sounds/bass/BAP.wav");
		addExternal("assets/sounds/bass/BIP.wav", "sound", "assets/sounds/bass/BIP.wav");
		addExternal("assets/sounds/bass/ded.wav", "sound", "assets/sounds/bass/ded.wav");
		addExternal("assets/sounds/bass/JIMPJUMP.wav", "sound", "assets/sounds/bass/JIMPJUMP.wav");
		addExternal("assets/sounds/bass/SCHWAP.wav", "sound", "assets/sounds/bass/SCHWAP.wav");
		addExternal("assets/sounds/bass/SHAA.wav", "sound", "assets/sounds/bass/SHAA.wav");
		addExternal("assets/sounds/bass/SPLOO.wav", "sound", "assets/sounds/bass/SPLOO.wav");
		addExternal("assets/sounds/bass/WOAAAAAAAAAAH.wav", "sound", "assets/sounds/bass/WOAAAAAAAAAAH.wav");
		addExternal("assets/sounds/bass/ZWAP.wav", "sound", "assets/sounds/bass/ZWAP.wav");
		addExternal("assets/sounds/bass/ZWOOP.wav", "sound", "assets/sounds/bass/ZWOOP.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/BAP.wav", "sound", "assets/sounds/Indie3JAMMUSIX/BAP.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/BIP.wav", "sound", "assets/sounds/Indie3JAMMUSIX/BIP.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/JIMPJUMP.wav", "sound", "assets/sounds/Indie3JAMMUSIX/JIMPJUMP.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/SCHWAP.wav", "sound", "assets/sounds/Indie3JAMMUSIX/SCHWAP.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/SHAA.wav", "sound", "assets/sounds/Indie3JAMMUSIX/SHAA.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/SPLOO.wav", "sound", "assets/sounds/Indie3JAMMUSIX/SPLOO.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/SWOOSWOOSWO.wav", "sound", "assets/sounds/Indie3JAMMUSIX/SWOOSWOOSWO.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/WOAAAAAAAAAAH.wav", "sound", "assets/sounds/Indie3JAMMUSIX/WOAAAAAAAAAAH.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/ZWAP.wav", "sound", "assets/sounds/Indie3JAMMUSIX/ZWAP.wav");
		addExternal("assets/sounds/Indie3JAMMUSIX/ZWOOP.wav", "sound", "assets/sounds/Indie3JAMMUSIX/ZWOOP.wav");
		addExternal("assets/sounds/sounds-go-here.txt", "text", "assets/sounds/sounds-go-here.txt");
		addExternal("assets/tiled/indie3-background.gif", "image", "assets/tiled/indie3-background.gif");
		addExternal("assets/tiled/indie3_tileset.png", "image", "assets/tiled/indie3_tileset.png");
		addExternal("assets/tiled/indie3_tilesetold.png", "image", "assets/tiled/indie3_tilesetold.png");
		addExternal("assets/tiled/tiles.png", "image", "assets/tiled/tiles.png");
		addExternal("assets/sounds/beep.mp3", "music", "assets/sounds/beep.mp3");
		addExternal("assets/sounds/flixel.mp3", "music", "assets/sounds/flixel.mp3");
		addExternal("flixel/flixel-ui/img/box.png", "image", "flixel/flixel-ui/img/box.png");
		addExternal("flixel/flixel-ui/img/button.png", "image", "flixel/flixel-ui/img/button.png");
		addExternal("flixel/flixel-ui/img/button_arrow_down.png", "image", "flixel/flixel-ui/img/button_arrow_down.png");
		addExternal("flixel/flixel-ui/img/button_arrow_left.png", "image", "flixel/flixel-ui/img/button_arrow_left.png");
		addExternal("flixel/flixel-ui/img/button_arrow_right.png", "image", "flixel/flixel-ui/img/button_arrow_right.png");
		addExternal("flixel/flixel-ui/img/button_arrow_up.png", "image", "flixel/flixel-ui/img/button_arrow_up.png");
		addExternal("flixel/flixel-ui/img/button_thin.png", "image", "flixel/flixel-ui/img/button_thin.png");
		addExternal("flixel/flixel-ui/img/button_toggle.png", "image", "flixel/flixel-ui/img/button_toggle.png");
		addExternal("flixel/flixel-ui/img/check_box.png", "image", "flixel/flixel-ui/img/check_box.png");
		addExternal("flixel/flixel-ui/img/check_mark.png", "image", "flixel/flixel-ui/img/check_mark.png");
		addExternal("flixel/flixel-ui/img/chrome.png", "image", "flixel/flixel-ui/img/chrome.png");
		addExternal("flixel/flixel-ui/img/chrome_flat.png", "image", "flixel/flixel-ui/img/chrome_flat.png");
		addExternal("flixel/flixel-ui/img/chrome_inset.png", "image", "flixel/flixel-ui/img/chrome_inset.png");
		addExternal("flixel/flixel-ui/img/chrome_light.png", "image", "flixel/flixel-ui/img/chrome_light.png");
		addExternal("flixel/flixel-ui/img/dropdown_mark.png", "image", "flixel/flixel-ui/img/dropdown_mark.png");
		addExternal("flixel/flixel-ui/img/finger_big.png", "image", "flixel/flixel-ui/img/finger_big.png");
		addExternal("flixel/flixel-ui/img/finger_small.png", "image", "flixel/flixel-ui/img/finger_small.png");
		addExternal("flixel/flixel-ui/img/hilight.png", "image", "flixel/flixel-ui/img/hilight.png");
		addExternal("flixel/flixel-ui/img/invis.png", "image", "flixel/flixel-ui/img/invis.png");
		addExternal("flixel/flixel-ui/img/minus_mark.png", "image", "flixel/flixel-ui/img/minus_mark.png");
		addExternal("flixel/flixel-ui/img/plus_mark.png", "image", "flixel/flixel-ui/img/plus_mark.png");
		addExternal("flixel/flixel-ui/img/radio.png", "image", "flixel/flixel-ui/img/radio.png");
		addExternal("flixel/flixel-ui/img/radio_dot.png", "image", "flixel/flixel-ui/img/radio_dot.png");
		addExternal("flixel/flixel-ui/img/swatch.png", "image", "flixel/flixel-ui/img/swatch.png");
		addExternal("flixel/flixel-ui/img/tab.png", "image", "flixel/flixel-ui/img/tab.png");
		addExternal("flixel/flixel-ui/img/tab_back.png", "image", "flixel/flixel-ui/img/tab_back.png");
		addExternal("flixel/flixel-ui/xml/defaults.xml", "text", "flixel/flixel-ui/xml/defaults.xml");
		addExternal("flixel/flixel-ui/xml/default_loading_screen.xml", "text", "flixel/flixel-ui/xml/default_loading_screen.xml");
		addExternal("flixel/flixel-ui/xml/default_popup.xml", "text", "flixel/flixel-ui/xml/default_popup.xml");
		
		
		#else
		
		#if (windows || mac || linux)
		
		var loadManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/indie3.tmx", __ASSET__assets_data_indie3_tmx);
		type.set ("assets/data/indie3.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/test.tmx", __ASSET__assets_data_test_tmx);
		type.set ("assets/data/test.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/all_anim.png", __ASSET__assets_images_all_anim_png);
		type.set ("assets/images/all_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/bloodparticle.png", __ASSET__assets_images_bloodparticle_png);
		type.set ("assets/images/bloodparticle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/bwbeb.png", __ASSET__assets_images_bwbeb_png);
		type.set ("assets/images/bwbeb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/dube.png", __ASSET__assets_images_dube_png);
		type.set ("assets/images/dube.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/enemy.png", __ASSET__assets_images_enemy_png);
		type.set ("assets/images/enemy.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/explod.png", __ASSET__assets_images_explod_png);
		type.set ("assets/images/explod.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/idle_anim.png", __ASSET__assets_images_idle_anim_png);
		type.set ("assets/images/idle_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/indie3 enemies.png", __ASSET__assets_images_indie3_enemies_png);
		type.set ("assets/images/indie3 enemies.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/indie3 jam stuff.png", __ASSET__assets_images_indie3_jam_stuff_png);
		type.set ("assets/images/indie3 jam stuff.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/indie3 tileset copy.png", __ASSET__assets_images_indie3_tileset_copy_png);
		type.set ("assets/images/indie3 tileset copy.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/jump_anim.png", __ASSET__assets_images_jump_anim_png);
		type.set ("assets/images/jump_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/placeholder2.png", __ASSET__assets_images_placeholder2_png);
		type.set ("assets/images/placeholder2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/placeholder_player.png", __ASSET__assets_images_placeholder_player_png);
		type.set ("assets/images/placeholder_player.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/run_anim.png", __ASSET__assets_images_run_anim_png);
		type.set ("assets/images/run_anim.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/shots.png", __ASSET__assets_images_shots_png);
		type.set ("assets/images/shots.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/shots_blaster.png", __ASSET__assets_images_shots_blaster_png);
		type.set ("assets/images/shots_blaster.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/shots_blaster_old.png", __ASSET__assets_images_shots_blaster_old_png);
		type.set ("assets/images/shots_blaster_old.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/music/ingame.mp3", __ASSET__assets_music_ingame_mp3);
		type.set ("assets/music/ingame.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/sounds/bass/BAP.wav", __ASSET__assets_sounds_bass_bap_wav);
		type.set ("assets/sounds/bass/BAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/BIP.wav", __ASSET__assets_sounds_bass_bip_wav);
		type.set ("assets/sounds/bass/BIP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/ded.wav", __ASSET__assets_sounds_bass_ded_wav);
		type.set ("assets/sounds/bass/ded.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/JIMPJUMP.wav", __ASSET__assets_sounds_bass_jimpjump_wav);
		type.set ("assets/sounds/bass/JIMPJUMP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/SCHWAP.wav", __ASSET__assets_sounds_bass_schwap_wav);
		type.set ("assets/sounds/bass/SCHWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/SHAA.wav", __ASSET__assets_sounds_bass_shaa_wav);
		type.set ("assets/sounds/bass/SHAA.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/SPLOO.wav", __ASSET__assets_sounds_bass_sploo_wav);
		type.set ("assets/sounds/bass/SPLOO.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/WOAAAAAAAAAAH.wav", __ASSET__assets_sounds_bass_woaaaaaaaaaah_wav);
		type.set ("assets/sounds/bass/WOAAAAAAAAAAH.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/ZWAP.wav", __ASSET__assets_sounds_bass_zwap_wav);
		type.set ("assets/sounds/bass/ZWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/bass/ZWOOP.wav", __ASSET__assets_sounds_bass_zwoop_wav);
		type.set ("assets/sounds/bass/ZWOOP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/BAP.wav", __ASSET__assets_sounds_indie3jammusix_bap_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/BAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/BIP.wav", __ASSET__assets_sounds_indie3jammusix_bip_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/BIP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/JIMPJUMP.wav", __ASSET__assets_sounds_indie3jammusix_jimpjump_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/JIMPJUMP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/SCHWAP.wav", __ASSET__assets_sounds_indie3jammusix_schwap_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SCHWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/SHAA.wav", __ASSET__assets_sounds_indie3jammusix_shaa_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SHAA.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/SPLOO.wav", __ASSET__assets_sounds_indie3jammusix_sploo_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SPLOO.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/SWOOSWOOSWO.wav", __ASSET__assets_sounds_indie3jammusix_swooswooswo_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/SWOOSWOOSWO.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/WOAAAAAAAAAAH.wav", __ASSET__assets_sounds_indie3jammusix_woaaaaaaaaaah_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/WOAAAAAAAAAAH.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/ZWAP.wav", __ASSET__assets_sounds_indie3jammusix_zwap_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/ZWAP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Indie3JAMMUSIX/ZWOOP.wav", __ASSET__assets_sounds_indie3jammusix_zwoop_wav);
		type.set ("assets/sounds/Indie3JAMMUSIX/ZWOOP.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/tiled/indie3-background.gif", __ASSET__assets_tiled_indie3_background_gif);
		type.set ("assets/tiled/indie3-background.gif", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/tiled/indie3_tileset.png", __ASSET__assets_tiled_indie3_tileset_png);
		type.set ("assets/tiled/indie3_tileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/tiled/indie3_tilesetold.png", __ASSET__assets_tiled_indie3_tilesetold_png);
		type.set ("assets/tiled/indie3_tilesetold.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/tiled/tiles.png", __ASSET__assets_tiled_tiles_png);
		type.set ("assets/tiled/tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#else
		
		var loadManifest = true;
		
		#end
		
		if (loadManifest) {
			try {
				
				#if blackberry
				var bytes = ByteArray.readFile ("app/native/manifest");
				#elseif tizen
				var bytes = ByteArray.readFile ("../res/manifest");
				#elseif emscripten
				var bytes = ByteArray.readFile ("assets/manifest");
				#else
				var bytes = ByteArray.readFile ("manifest");
				#end
				
				if (bytes != null) {
					
					bytes.position = 0;
					
					if (bytes.length > 0) {
						
						var data = bytes.readUTFBytes (bytes.length);
						
						if (data != null && data.length > 0) {
							
							var manifest:Array<AssetData> = Unserializer.run (data);
							
							for (asset in manifest) {
								
								if (!className.exists(asset.id)) {
									
									path.set (asset.id, asset.path);
									type.set (asset.id, asset.type);
									
								}
							}
						
						}
					
					}
				
				} else {
				
					trace ("Warning: Could not load asset manifest");
				
				}
			
			} catch (e:Dynamic) {
			
				trace ("Warning: Could not load asset manifest");
			
			}
		
		}
		
		#end
		
	}
	
	
	#if html5
	private function addEmbed(id:String, kind:String, value:Dynamic):Void {
		className.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	
	
	private function addExternal(id:String, kind:String, value:String):Void {
		path.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	#end
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif openfl_html5
		
		return null;
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_indie3_tmx extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_test_tmx extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_all_anim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_bloodparticle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_bwbeb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_dube_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_enemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_explod_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_idle_anim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_indie3_enemies_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_indie3_jam_stuff_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_indie3_tileset_copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_jump_anim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_placeholder2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_placeholder_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_run_anim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_shots_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_shots_blaster_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_shots_blaster_old_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_music_ingame_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_sounds_bass_bap_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_bip_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_ded_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_jimpjump_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_schwap_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_shaa_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_sploo_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_woaaaaaaaaaah_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_zwap_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_bass_zwoop_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_bap_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_bip_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_jimpjump_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_schwap_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_shaa_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_sploo_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_swooswooswo_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_woaaaaaaaaaah_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_zwap_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_indie3jammusix_zwoop_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_tiled_indie3_background_gif extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_indie3_tileset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_indie3_tilesetold_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_tiled_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray { }


#elseif html5



















































































#elseif (windows || mac || linux)


@:file("assets/data/data-goes-here.txt") class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray {}
@:file("assets/data/indie3.tmx") class __ASSET__assets_data_indie3_tmx extends flash.utils.ByteArray {}
@:file("assets/data/test.tmx") class __ASSET__assets_data_test_tmx extends flash.utils.ByteArray {}
@:bitmap("assets/images/all_anim.png") class __ASSET__assets_images_all_anim_png extends flash.display.BitmapData {}
@:bitmap("assets/images/bg.png") class __ASSET__assets_images_bg_png extends flash.display.BitmapData {}
@:bitmap("assets/images/bloodparticle.png") class __ASSET__assets_images_bloodparticle_png extends flash.display.BitmapData {}
@:bitmap("assets/images/bwbeb.png") class __ASSET__assets_images_bwbeb_png extends flash.display.BitmapData {}
@:bitmap("assets/images/dube.png") class __ASSET__assets_images_dube_png extends flash.display.BitmapData {}
@:bitmap("assets/images/enemy.png") class __ASSET__assets_images_enemy_png extends flash.display.BitmapData {}
@:bitmap("assets/images/explod.png") class __ASSET__assets_images_explod_png extends flash.display.BitmapData {}
@:bitmap("assets/images/idle_anim.png") class __ASSET__assets_images_idle_anim_png extends flash.display.BitmapData {}
@:file("assets/images/images-go-here.txt") class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray {}
@:bitmap("assets/images/indie3 enemies.png") class __ASSET__assets_images_indie3_enemies_png extends flash.display.BitmapData {}
@:bitmap("assets/images/indie3 jam stuff.png") class __ASSET__assets_images_indie3_jam_stuff_png extends flash.display.BitmapData {}
@:bitmap("assets/images/indie3 tileset copy.png") class __ASSET__assets_images_indie3_tileset_copy_png extends flash.display.BitmapData {}
@:bitmap("assets/images/jump_anim.png") class __ASSET__assets_images_jump_anim_png extends flash.display.BitmapData {}
@:bitmap("assets/images/placeholder2.png") class __ASSET__assets_images_placeholder2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/placeholder_player.png") class __ASSET__assets_images_placeholder_player_png extends flash.display.BitmapData {}
@:bitmap("assets/images/run_anim.png") class __ASSET__assets_images_run_anim_png extends flash.display.BitmapData {}
@:bitmap("assets/images/shots.png") class __ASSET__assets_images_shots_png extends flash.display.BitmapData {}
@:bitmap("assets/images/shots_blaster.png") class __ASSET__assets_images_shots_blaster_png extends flash.display.BitmapData {}
@:bitmap("assets/images/shots_blaster_old.png") class __ASSET__assets_images_shots_blaster_old_png extends flash.display.BitmapData {}
@:sound("assets/music/ingame.mp3") class __ASSET__assets_music_ingame_mp3 extends flash.media.Sound {}
@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray {}
@:sound("assets/sounds/bass/BAP.wav") class __ASSET__assets_sounds_bass_bap_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/BIP.wav") class __ASSET__assets_sounds_bass_bip_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/ded.wav") class __ASSET__assets_sounds_bass_ded_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/JIMPJUMP.wav") class __ASSET__assets_sounds_bass_jimpjump_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/SCHWAP.wav") class __ASSET__assets_sounds_bass_schwap_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/SHAA.wav") class __ASSET__assets_sounds_bass_shaa_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/SPLOO.wav") class __ASSET__assets_sounds_bass_sploo_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/WOAAAAAAAAAAH.wav") class __ASSET__assets_sounds_bass_woaaaaaaaaaah_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/ZWAP.wav") class __ASSET__assets_sounds_bass_zwap_wav extends flash.media.Sound {}
@:sound("assets/sounds/bass/ZWOOP.wav") class __ASSET__assets_sounds_bass_zwoop_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/BAP.wav") class __ASSET__assets_sounds_indie3jammusix_bap_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/BIP.wav") class __ASSET__assets_sounds_indie3jammusix_bip_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/JIMPJUMP.wav") class __ASSET__assets_sounds_indie3jammusix_jimpjump_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/SCHWAP.wav") class __ASSET__assets_sounds_indie3jammusix_schwap_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/SHAA.wav") class __ASSET__assets_sounds_indie3jammusix_shaa_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/SPLOO.wav") class __ASSET__assets_sounds_indie3jammusix_sploo_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/SWOOSWOOSWO.wav") class __ASSET__assets_sounds_indie3jammusix_swooswooswo_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/WOAAAAAAAAAAH.wav") class __ASSET__assets_sounds_indie3jammusix_woaaaaaaaaaah_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/ZWAP.wav") class __ASSET__assets_sounds_indie3jammusix_zwap_wav extends flash.media.Sound {}
@:sound("assets/sounds/Indie3JAMMUSIX/ZWOOP.wav") class __ASSET__assets_sounds_indie3jammusix_zwoop_wav extends flash.media.Sound {}
@:file("assets/sounds/sounds-go-here.txt") class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray {}
@:bitmap("assets/tiled/indie3-background.gif") class __ASSET__assets_tiled_indie3_background_gif extends flash.display.BitmapData {}
@:bitmap("assets/tiled/indie3_tileset.png") class __ASSET__assets_tiled_indie3_tileset_png extends flash.display.BitmapData {}
@:bitmap("assets/tiled/indie3_tilesetold.png") class __ASSET__assets_tiled_indie3_tilesetold_png extends flash.display.BitmapData {}
@:bitmap("assets/tiled/tiles.png") class __ASSET__assets_tiled_tiles_png extends flash.display.BitmapData {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,1/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/3,3,1/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/box.png") class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/button.png") class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/button_arrow_down.png") class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/button_arrow_left.png") class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/button_arrow_right.png") class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/button_arrow_up.png") class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/button_thin.png") class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/button_toggle.png") class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/check_box.png") class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/check_mark.png") class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/chrome.png") class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/chrome_flat.png") class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/chrome_inset.png") class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/chrome_light.png") class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/dropdown_mark.png") class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/finger_big.png") class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/finger_small.png") class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/hilight.png") class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/invis.png") class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/minus_mark.png") class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/plus_mark.png") class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/radio.png") class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/radio_dot.png") class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/swatch.png") class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/tab.png") class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/images/tab_back.png") class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/xml/defaults.xml") class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/xml/default_loading_screen.xml") class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/git/assets/xml/default_popup.xml") class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray {}


#end
