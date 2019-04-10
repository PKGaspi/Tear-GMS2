/// @description Variables for the menu.

enum menu_page {
	pause,
	settings,
	video,
	audio,
	controls,
	misc,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

// Anti-aliasing array.

var aa_array;
var i = 0;
var array_len = array_length_1d(global.antialiasing_values);
repeat (array_len) {
	aa_array[i] = string(global.antialiasing_values[i]) + "x";
	i++;
}

// Menu pages.

ds_menu_pause = create_menu_page(
	[["Resume",						"Volver al juego"],			spr_resume,						menu_element_type.script_runner,			resume_game																			],
	[["Settings",					"Opciones"],				spr_settings,					menu_element_type.page_transfer,			menu_page.settings																	],
	[["Exit the game",				"Salir del juego"],			spr_exit,						menu_element_type.script_runner,			exit_game,					["Pause", "Pausa"]										]
);

ds_menu_settings = create_menu_page(
	[["Change Language",			"Cambiar idioma"],			spr_settings_language,			menu_element_type.shift,					set_language,				get_language_num(global.language),	["English", "Español"]		],
	[["Video settings",				"Ajustes de vídeo"],		spr_settings_video,				menu_element_type.page_transfer,			menu_page.video																		],
	[["Audio settings",				"Ajustes de sonido"],		spr_settings_audio,				menu_element_type.page_transfer,			menu_page.audio																		],
	[["Control settings",			"Ajustes de controles"],	spr_settings_control,			menu_element_type.page_transfer,			menu_page.controls																	],
	[["Misc settings",				"Otros ajustes"],			spr_settings_other,				menu_element_type.page_transfer,			menu_page.misc																		],
	[["Back",						"Atrás"],					spr_back,						menu_element_type.page_transfer,			menu_page.pause,			["Settings", "Ajustes"]									]
);

ds_menu_video = create_menu_page(
	[["Fullscreen",					"Pantalla completa"],		spr_settings_video_fullscreen,	menu_element_type.toggle,					toggle_fullscreen,			window_get_fullscreen(),								],
	[["Resolution",					"Resolución"],				spr_settings_video_resolution,	menu_element_type.shift,					set_resolution,				global.resolution,			get_resolutions()			],
	[["Anti-aliasing",				"Anti-aliasing"],			spr_settings_video_aa,			menu_element_type.shift,					set_antialiasing,			global.antialiasing,		aa_array					],
	[["V-sync",						"V-sync"],					spr_settings_video_vsync,		menu_element_type.toggle,					toggle_vsync,				global.vsync											],
	[["Back",						"Atrás"],					spr_back,						menu_element_type.page_transfer,			menu_page.settings,			["Video settings", "Ajustes de vídeo"]					]
);

ds_menu_audio = create_menu_page(
	[["Master volume",				"Volumen maestro"],			spr_settings_audio_master,		menu_element_type.slider,					set_volume,					global.master_volume,		[0,1]						],
	[["Music volume",				"Volumen de música"],		spr_settings_audio_music,		menu_element_type.slider,					set_volume,					global.music_volume,		[0,1]						],
	[["Efects volume",				"Volumen de efectos"],		spr_settings_audio_sounds,		menu_element_type.slider,					set_volume,					global.sound_volume,		[0,1]						],
	[["Mute audio",					"Silenciar audio"],			spr_settings_audio_mute,		menu_element_type.toggle,					toggle_audio,				global.audio_muted										],
	[["Back",						"Atrás"],					spr_back,						menu_element_type.page_transfer,			menu_page.settings,			["Audio settings", "Ajustes de sonido"],				]
);

ds_menu_controls = create_menu_page(
	[["Back",						"Atrás"],					spr_back,						menu_element_type.page_transfer,			menu_page.settings,			["Control settings", "Ajustes de controles"]			]
);

ds_menu_other = create_menu_page(
	[["Back",						"Atrás"],					spr_back,						menu_element_type.page_transfer,			menu_page.settings,			["Other settings", "Otros ajustes"]						]
);

page = 0;
menu_pages = [ds_menu_pause, ds_menu_settings, ds_menu_video, ds_menu_audio, ds_menu_controls, ds_menu_other];

var i = 0;
var array_len = array_length_1d(menu_pages);
repeat (array_len) {
	menu_option[i] = 0;
	i++;
}