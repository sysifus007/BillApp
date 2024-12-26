import relationalStore from '@ohos.data.relationalStore';

export default class CommonConstants {


  /**
   * Component size.
   */
  static readonly FULL_WIDTH = '100%';
  static readonly FULL_HEIGHT = '100%';
  static readonly DIALOG_HEIGHT = '55%';
  static readonly TABS_HEIGHT = '45%';
  static readonly MINIMUM_SIZE = 0;
  static readonly FULL_SIZE = 1;
  static readonly PROMPT_BOTTOM = '70vp';







  /**
   * The main ability tag.
   */
  static readonly ENTRY_ABILITY_TAG: string = 'EntryAbility';

  /**
   * The launcher page tag.
   */
  static readonly LAUNCHER_PAGE_TAG: string = 'LauncherPage';

  /**
   * The advertsing page tag.
   */
  static readonly ADVERTISING_PAGE_TAG: string = 'AdvertisingPage';

  /**
   * The custom dialog component tag.
   */
  static readonly CUSTOM_DIALOG_TAG: string = 'CustomDialogComponent';

  /**
   * Preference saved key.
   */
  static readonly PREFERENCES_KEY_PRIVACY: string = 'isPrivacy';

  /**
   * Preference saved file name.
   */
  static readonly PREFERENCES_FILE_NAME: string = 'myStore';

  /**
   * Launcher page count down.
   */
  static readonly LAUNCHER_DELAY_TIME: number = 3000;

  /**
   * Image logo top margin.
   */
  static readonly LAUNCHER_IMAGE_MARGIN_TOP: string = '16.2%';

  /**
   * Healthy living text spacing.
   */
  static readonly LAUNCHER_LIFE_TEXT_SPACING: number = 0.1;

  /**
   * Healthy living title text top margin.
   */
  static readonly LAUNCHER_TEXT_TITLE_MARGIN_TOP: string = '0.5%';

  /**
   * Content control height.
   */
  static readonly LAUNCHER_TEXT_INTRODUCE_HEIGHT: string = '2.7%';

  /**
   * Healthy living instructions.
   */
  static readonly LAUNCHER_TEXT_INTRODUCE_SPACING: number = 3.4;

  /**
   * Healthy living content top margin.
   */
  static readonly LAUNCHER_TEXT_INTRODUCE_MARGIN_TOP: string = '1.3%';

  /**
   * Interval execution time.
   */
  static readonly ADVERTISING_INTERVAL_TIME: number = 1000;


  /**
   * Display countdown seconds.
   */
  static readonly ADVERTISING_COUNT_DOWN_SECONDS: number = 2;

  /**
   * Count down text spacing.
   */
  static readonly ADVERTISING_TITLE_TEXT_LETTER_SPACING: number = 0.05;

  /**
   * Advertising page healthy text spacing.
   */
  static readonly ADVERTISING_HEALTHY_LIFE_TEXT_SPACING: number = 0.1;

  /**
   * Advertising page health description text spacing.
   */
  static readonly ADVERTISING_TEXT_INTRODUCE_LETTER_SPACING: number = 3.4;

  /**
   * Advertising page health description text top margin.
   */
  static readonly ADVERTISING_TEXT_INTRODUCE_MARGIN_TOP: string = '0.4%';

  /**
   * Column container left margin.
   */
  static readonly ADVERTISING_COLUMN_MARGIN_LEFT: string = '3.1%';

  /**
   * Row container bottom margin.
   */
  static readonly ADVERTISING_ROW_MARGIN_BOTTOM: string = '3.1%';

  /**
   * Dialog component width the percentage of the 90.
   */
  static readonly DIALOG_COMPONENT_WIDTH_PERCENT: string = '90%';

  /**
   * Dialog title text weight.
   */
  static readonly DIALOG_TITLE_FONT_WEIGHT: number = 600;

  /**
   * Dialog width the percentage of the 93.3.
   */
  static readonly DIALOG_WIDTH_PERCENT: string = '93.3%';

  /**
   * Dialog border radius.
   */
  static readonly DIALOG_BORDER_RADIUS: number = 24;

  /**
   * Dialog component bottom margin,
   */
  static readonly DIALOG_ROW_MARGIN_BOTTOM: string = '3.1%';

  /**
   * Dialog y-axis offset distance.
   */
  static readonly DIALOG_CONTROLLER_DY_OFFSET: number = -24;

  /**
   * Privacy page url.
   */
  static readonly PRIVACY_PAGE_URL: string = 'pages/PrivacyPage';


  /**
   * Common layout weight.
   */
  static readonly COMMON_LAYOUT_WEIGHT: number = 1;


  /**
   * Search weight.
   */
  static readonly SEARCH_WEIGHT: number = 10;

  /**
   * The divider stroke width.
   */
  static readonly DIVIDER_STROKE_WIDTH: number = 1;

  /**
   * The offset of detail list for LG device.
   */
  static readonly DETAIL_LIST_OFFSET_LG: number = 1;

  /**
   * The offset of detail list for MD device.
   */
  static readonly DETAIL_LIST_OFFSET_MD: number = 1;

  /**
   * The span of detail list for LG device.
   */
  static readonly DETAIL_LIST_SPAN_LG: number = 9;

  /**
   * The span of detail list for MD device.
   */
  static readonly DETAIL_LIST_SPAN_MD: number = 6;

  /**
   * The span of detail list for SM device.
   */
  static readonly DETAIL_LIST_SPAN_SM: number = 3;

  /**
   * The span of side list for SM device.
   */
  static readonly SIDE_LIST_SPAN_SM: number = 1;

  /**
   * The span of side list for MD device.
   */
  static readonly SIDE_LIST_SPAN_MD: number = 2;

  /**
   * The span of side list for LG device.
   */
  static readonly SIDE_LIST_SPAN_LG: number = 2;

  /**
   * The span of top component for LG device.
   */
  static readonly TOP_SPAN_LG: number = 12;

  /**
   * The span of top component for MD device.
   */
  static readonly TOP_SPAN_MD: number = 8;

  /**
   * The span of top component for SM device.
   */
  static readonly TOP_SPAN_SM: number = 4;

  /**
   * The columns for LG device.
   */
  static readonly COLUMN_LG: number = 12;

  /**
   * The columns for MD device.
   */
  static readonly COLUMN_MD: number = 8;

  /**
   * The columns for SM device.
   */
  static readonly COLUMN_SM: number = 4;

  /**
   * The columns of grid columns gap except SM device.
   */
  static readonly GRID_COLUMNS_GAP_NORMAL: number = 24;

  /**
   * The columns of grid columns gap for SM device.
   */
  static readonly GRID_COLUMNS_GAP_SM: number = 12;

  /**
   * The gutter for all devices.
   */
  static readonly GUTTER_X: number = vp2px(24);

  /**
   * The break point value.
   */
  static readonly BREAK_POINTS_VALUE: Array<string> = ['320vp', '600vp', '840vp'];

  /**
   * Three item template of Grid.
   */
  static readonly GRID_TEMPLATE_THREE: string = '1fr 1fr 1fr';

  /**
   * Two item template of Grid.
   */
  static readonly GRID_TEMPLATE_TWO: string = '1fr 1fr';

  /**
   * Break point is sm.
   */
  static readonly BREAK_POINT_SM: string = 'sm';

  /**
   * Break point is lg.
   */
  static readonly BREAK_POINT_LG: string = 'lg';

  /**
   * The placeholder of search component.Currently, component interfaces do not support the Resource type.
   * Therefore, you need to define constants. The default prompt in the search box does not support
   * internationalization.
   */
  static readonly SEARCH_PLACEHOLDER: string = 'Search...';

  /**
   * Search font family.
   */
  static readonly SEARCH_FONT_FAMILY: string = 'serif';

  /**
   * The font weight of text in the index list.
   */
  static readonly INDEX_LIST_FONT_WEIGHT: number = 400;

  /**
   * Size of index list and detail list.
   */
  static readonly LIST_SIZE: number = 6;

  /**
   * The font weight of text in the detail list.
   */
  static readonly DETAIL_LIST_FONT_WEIGHT: number = 500;

  /**
   * The font weight of text in the tab.
   */
  static readonly TAB_ITEM_FONT_WEIGHT: number = 500;

  /**
   * Size of tab bar.
   */
  static readonly TAB_BAR_SIZE: number = 5;

  /**
   * Tab layout weight.
   */
  static readonly TAB_LAYOUT_WEIGHT: number = 1;

  /**
   * The font weight of title.
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * The font weight of subtitle.
   */
  static readonly SUBTITLE_FONT_WEIGHT: number = 400;

  /**
   * Size of detail item.
   */
  static readonly DETAIL_ITEM_SIZE: number = 6;

  /**
   * The percentage of the full width.
   */
  static readonly FULL_WIDTH_PERCENT: string = '100%';

  /**
   * The percentage of the full height.
   */
  static readonly FULL_HEIGHT_PERCENT: string = '100%';

  /**
   * The percentage of the half height.
   */
  static readonly HALF_HEIGHT_PERCENT: string = '50%';


  /**
   * The number of columns for SM device.
   */
  static readonly GRID_ROW_SM: number = 4;

  /**
   * The number of columns for MD device.
   */
  static readonly GRID_ROW_MD: number = 8;

  /**
   * The number of columns for LG device.
   */
  static readonly GRID_ROW_LG: number = 12;


  /**
   * The span of page for SM device.
   */
  static readonly SPAN_SM: number = 4;

  /**
   * The span of page for MD device.
   */
  static readonly SPAN_MD: number = 6;

  /**
   * The span of page for LG device.
   */
  static readonly SPAN_LG: number = 8;

  /**
   * The offset of page for SM device.
   */
  static readonly OFFSET_SM: number = 1;

  /**
   * The offset of page for MD device.
   */
  static readonly OFFSET_MD: number = 1;

  /**
   * The offset of page for LG device.
   */
  static readonly OFFSET_LG: number = 2;

  /**
   * The weight of row for device.
   */
  static readonly ROW_WEIGHT: number = 4;

  /**
   * The weight of row for LG device.
   */
  static readonly ROW_LG_WEIGHT: number = 5;

  /**
   * The weight of flex for device.
   */
  static readonly FLEX_WEIGHT: number = 6;

  /**
   * The weight of flex for LG device.
   */
  static readonly FLEX_LG_WEIGHT: number = 5;

  /**
   * The break point for page.
   */
  static readonly BREAK_POINT: Array<string> = ['320vp', '600vp', '840vp'];


  /**
   * Font weight.
   */
  static readonly FONT_WEIGHT: number = 500;

  /**
   * Scroll weight.
   */
  static readonly SCROLL_WEIGHT: number = 1;

  /**
   * Application version example.
   */
  static readonly APP_VERSION: string = '1.0.0';

  /**
   * Detail page url.
   */
  static readonly DETAIL_PAGE: string = 'pages/about/DetailPage';

  /**
   * Agreement page url.
   */
  static readonly AGREEMENT_PAGE: string = 'pages/about/AgreementPage';

  /**
   * Privacy page url.
   */
  static readonly PRIVACY_PAGE: string = 'pages/about/PrivacyPage';

  /**
   * About us item id.
   */
  static readonly ABOUT_US_ID: number = 1;

  /**
   * Contact item id.
   */
  static readonly CONTACT_ID: number = 2;

  /**
   * Detail page default content row.
   */
  static readonly DETAIL_DEFAULT_ROW: number = 2;

  /**
   * This is key param of data.
   */
  static readonly KEY_PARAM_DATA: string = 'data';

  /**
   * This is key param of title.
   */
  static readonly KEY_PARAM_TITLE: string = 'title';

  /**
   * Detail column title text width percentage setting.
   */
  static readonly DETAIL_COLUMN_WIDTH_PERCENT: string = '100%';

  /**
   * Detail column height percentage setting.
   */
  static readonly DETAIL_COLUMN_HEIGHT_PERCENT: string = '100%';


  /**
   * Row width percentage setting.
   */
  static readonly ROW_WIDTH_PERCENT: string = '100%';

  /**
   * Scroll height percentage setting.
   */
  static readonly SCROLL_HEIGHT_PERCENT: string = '100%';

  /**
   * Tech Support column width percentage setting.
   */
  static readonly TECH_COLUMN_WIDTH_PERCENT: string = '100%';

  /**
   * Detail column list width percentage setting.
   */
  static readonly DETAIL_LIST_WIDTH_PERCENT: string = '93.3%';


  /**
   * Watermelon image url.
   */
  static readonly WATERMELON_IMAGE_URL: string = '../../../resources/base/media/ic_watermelon.png';

  /**
   * Hamburg image url.
   */
  static readonly HAMBURG_IMAGE_URL: string = '../../../resources/base/media/ic_hamburg.png';

  /**
   * Cake image url.
   */
  static readonly CAKE_IMAGE_URL: string = '../../../resources/base/media/ic_cake.png';

  /**
   * Beer image url.
   */
  static readonly BEER_IMAGE_URL: string = '../../../resources/base/media/ic_beer.png';

  /**
   * Smile image url.
   */
  static readonly SMILE_IMAGE_URL: string = '../../../resources/base/media/ic_smile.png';

  /**
   * Transform angle.
   */
  static readonly TRANSFORM_ANGLE: number = -120;

  /**
   * 360 degrees.
   */
  static readonly CIRCLE: number = 360;

  /**
   * 180 degrees.
   */
  static readonly HALF_CIRCLE: number = 180;

  /**
   * count.
   */
  static readonly COUNT: number = 6;

  /**
   * Small circle count.
   */
  static readonly SMALL_CIRCLE_COUNT: number = 8;

  /**
   * Image size.
   */
  static readonly IMAGE_SIZE: number = 40;

  /**
   * Prize angle.
   */
  static readonly ANGLE: number = 270;

  /**
   * duration.
   */
  static readonly DURATION: number = 4000;

  /**
   * One.
   */
  static readonly ONE: number = 1;

  /**
   * Two.
   */
  static readonly TWO: number = 2;

  /**
   * Three.
   */
  static readonly THREE: number = 3;

  /**
   * Four.
   */
  static readonly FOUR: number = 4;

  /**
   * Five.
   */
  static readonly FIVE: number = 5;

  /**
   * Six.
   */
  static readonly SIX: number = 6;

  /**
   * Flower point y ratios.
   */
  static readonly FLOWER_POINT_Y_RATIOS: number = 0.255;

  /**
   * Flower radius ratios.
   */
  static readonly FLOWER_RADIUS_RATIOS: number = 0.217;

  /**
   * Flower inner radius ratios.
   */
  static readonly FLOWER_INNER_RATIOS: number = 0.193;

  /**
   * Out circle ratios.
   */
  static readonly OUT_CIRCLE_RATIOS: number = 0.4;

  /**
   * Small circle ratios.
   */
  static readonly SMALL_CIRCLE_RATIOS: number = 0.378;

  /**
   * Small circle radius.
   */
  static readonly SMALL_CIRCLE_RADIUS: number = 4.1;

  /**
   * Inner circle ratios.
   */
  static readonly INNER_CIRCLE_RATIOS: number = 0.356;

  /**
   * Inner white circle ratios.
   */
  static readonly INNER_WHITE_CIRCLE_RATIOS: number = 0.339;

  /**
   * Inner arc ratios.
   */
  static readonly INNER_ARC_RATIOS: number = 0.336;

  /**
   * Image dx ratios.
   */
  static readonly IMAGE_DX_RATIOS: number = 0.114;

  /**
   * Image dy ratios.
   */
  static readonly IMAGE_DY_RATIOS: number = 0.052;

  /**
   * Arc text start angle.
   */
  static readonly ARC_START_ANGLE: number = 34;

  /**
   * Arc text end angle.
   */
  static readonly ARC_END_ANGLE: number = 26;

  /**
   * Text align.
   */
  static readonly TEXT_ALIGN: CanvasTextAlign = 'center';

  /**
   * Text base line.
   */
  static readonly TEXT_BASE_LINE: CanvasTextBaseline = 'middle';

  /**
   * Canvas font.
   */
  static readonly CANVAS_FONT: string = 'px sans-serif';


  /**
   * Input length of the account.
   */
  static readonly INPUT_ACCOUNT_LENGTH = 11;

  /**
   *  Input length of the password.
   */
  static readonly INPUT_PASSWORD_LENGTH = 8;

  /**
   *  Left padding of the input box
   */
  static readonly INPUT_PADDING_LEFT = 0;

  /**
   * Delay time of simulated login
   */
  static readonly LOGIN_DELAY_TIME = 2000;

  /**
   * Common Spacing of Components
   */
  static readonly COMMON_SPACE = 2;

  /**
   * Title text of the home page
   */
  static readonly HOME_TITLE = '首页';

  /**
   * Title text of the setting page
   */
  static readonly MINE_TITLE = '我的';

  /**
   * Spacing of other login methods
   */
  static readonly LOGIN_METHODS_SPACE = 44;

  /**
   * The width or height of the component is spread across the parent component.
   */
  static readonly FULL_PARENT = '100%';

  /**
   * The width of button
   */
  static readonly BUTTON_WIDTH = '90%';

  /**
   * The width of setting list
   */
  static readonly SET_LIST_WIDTH = '42%';

  /**
   * Home tab index
   */
  static readonly HOME_TAB_INDEX = 0;
  static readonly JINGXUAN_TAB_INDEX = 1;
  /**
   * Mine tab index
   */
  static readonly MINE_TAB_INDEX = 2;
}