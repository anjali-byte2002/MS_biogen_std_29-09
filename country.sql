
WITH country_ref (country_name, alpha2, alpha3) AS (
SELECT 'Afghanistan', 'AF', 'AFG'
UNION ALL SELECT 'Aland Islands', 'AX', 'ALA'
UNION ALL SELECT 'Albania', 'AL', 'ALB'
UNION ALL SELECT 'Algeria', 'DZ', 'DZA'
UNION ALL SELECT 'American Samoa', 'AS', 'ASM'
UNION ALL SELECT 'Andorra', 'AD', 'AND'
UNION ALL SELECT 'Angola', 'AO', 'AGO'
UNION ALL SELECT 'Anguilla', 'AI', 'AIA'
UNION ALL SELECT 'Antarctica', 'AQ', 'ATA'
UNION ALL SELECT 'Antigua and Barbuda', 'AG', 'ATG'
UNION ALL SELECT 'Argentina', 'AR', 'ARG'
UNION ALL SELECT 'Armenia', 'AM', 'ARM'
UNION ALL SELECT 'Aruba', 'AW', 'ABW'
UNION ALL SELECT 'Australia', 'AU', 'AUS'
UNION ALL SELECT 'Austria', 'AT', 'AUT'
UNION ALL SELECT 'Azerbaijan', 'AZ', 'AZE'
UNION ALL SELECT 'Bahamas', 'BS', 'BHS'
UNION ALL SELECT 'Bahrain', 'BH', 'BHR'
UNION ALL SELECT 'Bangladesh', 'BD', 'BGD'
UNION ALL SELECT 'Barbados', 'BB', 'BRB'
UNION ALL SELECT 'Belarus', 'BY', 'BLR'
UNION ALL SELECT 'Belgium', 'BE', 'BEL'
UNION ALL SELECT 'Belize', 'BZ', 'BLZ'
UNION ALL SELECT 'Benin', 'BJ', 'BEN'
UNION ALL SELECT 'Bermuda', 'BM', 'BMU'
UNION ALL SELECT 'Bhutan', 'BT', 'BTN'
UNION ALL SELECT 'Bolivia', 'BO', 'BOL'
UNION ALL SELECT 'Bosnia and Herzegovina', 'BA', 'BIH'
UNION ALL SELECT 'Botswana', 'BW', 'BWA'
UNION ALL SELECT 'Bouvet Island', 'BV', 'BVT'
UNION ALL SELECT 'Brazil', 'BR', 'BRA'
UNION ALL SELECT 'British Virgin Islands', 'VG', 'VGB'
UNION ALL SELECT 'British Indian Ocean Territory', 'IO', 'IOT'
UNION ALL SELECT 'Brunei Darussalam', 'BN', 'BRN'
UNION ALL SELECT 'Bulgaria', 'BG', 'BGR'
UNION ALL SELECT 'Burkina Faso', 'BF', 'BFA'
UNION ALL SELECT 'Burundi', 'BI', 'BDI'
UNION ALL SELECT 'Cambodia', 'KH', 'KHM'
UNION ALL SELECT 'Cameroon', 'CM', 'CMR'
UNION ALL SELECT 'Canada', 'CA', 'CAN'
UNION ALL SELECT 'Cape Verde', 'CV', 'CPV'
UNION ALL SELECT 'Cayman Islands', 'KY', 'CYM'
UNION ALL SELECT 'Central African Republic', 'CF', 'CAF'
UNION ALL SELECT 'Chad', 'TD', 'TCD'
UNION ALL SELECT 'Chile', 'CL', 'CHL'
UNION ALL SELECT 'China', 'CN', 'CHN'
UNION ALL SELECT 'Christmas Island', 'CX', 'CXR'
UNION ALL SELECT 'Cocos (Keeling) Islands', 'CC', 'CCK'
UNION ALL SELECT 'Colombia', 'CO', 'COL'
UNION ALL SELECT 'Comoros', 'KM', 'COM'
UNION ALL SELECT 'Congo', 'CG', 'COG'
UNION ALL SELECT 'Congo, The Democratic Republic of the', 'CD', 'COD'
UNION ALL SELECT 'Cook Islands', 'CK', 'COK'
UNION ALL SELECT 'Costa Rica', 'CR', 'CRI'
UNION ALL SELECT 'Cote d''Ivoire', 'CI', 'CIV'
UNION ALL SELECT 'Croatia', 'HR', 'HRV'
UNION ALL SELECT 'Cuba', 'CU', 'CUB'
UNION ALL SELECT 'Cyprus', 'CY', 'CYP'
UNION ALL SELECT 'Czech Republic', 'CZ', 'CZE'
UNION ALL SELECT 'Denmark', 'DK', 'DNK'
UNION ALL SELECT 'Djibouti', 'DJ', 'DJI'
UNION ALL SELECT 'Dominica', 'DM', 'DMA'
UNION ALL SELECT 'Dominican Republic', 'DO', 'DOM'
UNION ALL SELECT 'Ecuador', 'EC', 'ECU'
UNION ALL SELECT 'Egypt', 'EG', 'EGY'
UNION ALL SELECT 'El Salvador', 'SV', 'SLV'
UNION ALL SELECT 'Equatorial Guinea', 'GQ', 'GNQ'
UNION ALL SELECT 'Eritrea', 'ER', 'ERI'
UNION ALL SELECT 'Estonia', 'EE', 'EST'
UNION ALL SELECT 'Ethiopia', 'ET', 'ETH'
UNION ALL SELECT 'Falkland Islands (Malvinas)', 'FK', 'FLK'
UNION ALL SELECT 'Faroe Islands', 'FO', 'FRO'
UNION ALL SELECT 'Fiji', 'FJ', 'FJI'
UNION ALL SELECT 'Finland', 'FI', 'FIN'
UNION ALL SELECT 'France', 'FR', 'FRA'
UNION ALL SELECT 'French Guiana', 'GF', 'GUF'
UNION ALL SELECT 'French Polynesia', 'PF', 'PYF'
UNION ALL SELECT 'French Southern Territories', 'TF', 'ATF'
UNION ALL SELECT 'Gabon', 'GA', 'GAB'
UNION ALL SELECT 'Gambia', 'GM', 'GMB'
UNION ALL SELECT 'Georgia', 'GE', 'GEO'
UNION ALL SELECT 'Germany', 'DE', 'DEU'
UNION ALL SELECT 'Ghana', 'GH', 'GHA'
UNION ALL SELECT 'Gibraltar', 'GI', 'GIB'
UNION ALL SELECT 'Greece', 'GR', 'GRC'
UNION ALL SELECT 'Greenland', 'GL', 'GRL'
UNION ALL SELECT 'Grenada', 'GD', 'GRD'
UNION ALL SELECT 'Guadeloupe', 'GP', 'GLP'
UNION ALL SELECT 'Guam', 'GU', 'GUM'
UNION ALL SELECT 'Guatemala', 'GT', 'GTM'
UNION ALL SELECT 'Guernsey', 'GG', 'GGY'
UNION ALL SELECT 'Guinea', 'GN', 'GIN'
UNION ALL SELECT 'Guinea-Bissau', 'GW', 'GNB'
UNION ALL SELECT 'Guyana', 'GY', 'GUY'
UNION ALL SELECT 'Haiti', 'HT', 'HTI'
UNION ALL SELECT 'Heard Island and Mcdonald Islands', 'HM', 'HMD'
UNION ALL SELECT 'Holy See (Vatican City State)', 'VA', 'VAT'
UNION ALL SELECT 'Honduras', 'HN', 'HND'
UNION ALL SELECT 'Hong Kong', 'HK', 'HKG'
UNION ALL SELECT 'Hungary', 'HU', 'HUN'
UNION ALL SELECT 'Iceland', 'IS', 'ISL'
UNION ALL SELECT 'India', 'IN', 'IND'
UNION ALL SELECT 'Indonesia', 'ID', 'IDN'
UNION ALL SELECT 'Iran, Islamic Republic of', 'IR', 'IRN'
UNION ALL SELECT 'Iraq', 'IQ', 'IRQ'
UNION ALL SELECT 'Ireland', 'IE', 'IRL'
UNION ALL SELECT 'Isle of Man', 'IM', 'IMN'
UNION ALL SELECT 'Israel', 'IL', 'ISR'
UNION ALL SELECT 'Italy', 'IT', 'ITA'
UNION ALL SELECT 'Jamaica', 'JM', 'JAM'
UNION ALL SELECT 'Japan', 'JP', 'JPN'
UNION ALL SELECT 'Jersey', 'JE', 'JEY'
UNION ALL SELECT 'Jordan', 'JO', 'JOR'
UNION ALL SELECT 'Kazakhstan', 'KZ', 'KAZ'
UNION ALL SELECT 'Kenya', 'KE', 'KEN'
UNION ALL SELECT 'Kiribati', 'KI', 'KIR'
UNION ALL SELECT 'Korea, Democratic People''s Republic of', 'KP', 'PRK'
UNION ALL SELECT 'Korea, Republic of', 'KR', 'KOR'
UNION ALL SELECT 'Kuwait', 'KW', 'KWT'
UNION ALL SELECT 'Kyrgyzstan', 'KG', 'KGZ'
UNION ALL SELECT 'Lao PDR', 'LA', 'LAO'
UNION ALL SELECT 'Latvia', 'LV', 'LVA'
UNION ALL SELECT 'Lebanon', 'LB', 'LBN'
UNION ALL SELECT 'Lesotho', 'LS', 'LSO'
UNION ALL SELECT 'Liberia', 'LR', 'LBR'
UNION ALL SELECT 'Libya', 'LY', 'LBY'
UNION ALL SELECT 'Liechtenstein', 'LI', 'LIE'
UNION ALL SELECT 'Lithuania', 'LT', 'LTU'
UNION ALL SELECT 'Luxembourg', 'LU', 'LUX'
UNION ALL SELECT 'Macao', 'MO', 'MAC'
UNION ALL SELECT 'Macedonia, Republic of', 'MK', 'MKD'
UNION ALL SELECT 'Madagascar', 'MG', 'MDG'
UNION ALL SELECT 'Malawi', 'MW', 'MWI'
UNION ALL SELECT 'Malaysia', 'MY', 'MYS'
UNION ALL SELECT 'Maldives', 'MV', 'MDV'
UNION ALL SELECT 'Mali', 'ML', 'MLI'
UNION ALL SELECT 'Malta', 'MT', 'MLT'
UNION ALL SELECT 'Marshall Islands', 'MH', 'MHL'
UNION ALL SELECT 'Martinique', 'MQ', 'MTQ'
UNION ALL SELECT 'Mauritania', 'MR', 'MRT'
UNION ALL SELECT 'Mauritius', 'MU', 'MUS'
UNION ALL SELECT 'Mayotte', 'YT', 'MYT'
UNION ALL SELECT 'Mexico', 'MX', 'MEX'
UNION ALL SELECT 'Micronesia, Federated States of', 'FM', 'FSM'
UNION ALL SELECT 'Moldova', 'MD', 'MDA'
UNION ALL SELECT 'Monaco', 'MC', 'MCO'
UNION ALL SELECT 'Mongolia', 'MN', 'MNG'
UNION ALL SELECT 'Montenegro', 'ME', 'MNE'
UNION ALL SELECT 'Montserrat', 'MS', 'MSR'
UNION ALL SELECT 'Morocco', 'MA', 'MAR'
UNION ALL SELECT 'Mozambique', 'MZ', 'MOZ'
UNION ALL SELECT 'Myanmar', 'MM', 'MMR'
UNION ALL SELECT 'Namibia', 'NA', 'NAM'
UNION ALL SELECT 'Nauru', 'NR', 'NRU'
UNION ALL SELECT 'Nepal', 'NP', 'NPL'
UNION ALL SELECT 'Netherlands', 'NL', 'NLD'
UNION ALL SELECT 'Netherlands Antilles', 'AN', 'ANT'
UNION ALL SELECT 'New Caledonia', 'NC', 'NCL'
UNION ALL SELECT 'New Zealand', 'NZ', 'NZL'
UNION ALL SELECT 'Nicaragua', 'NI', 'NIC'
UNION ALL SELECT 'Niger', 'NE', 'NER'
UNION ALL SELECT 'Nigeria', 'NG', 'NGA'
UNION ALL SELECT 'Niue', 'NU', 'NIU'
UNION ALL SELECT 'Norfolk Island', 'NF', 'NFK'
UNION ALL SELECT 'Northern Mariana Islands', 'MP', 'MNP'
UNION ALL SELECT 'Norway', 'NO', 'NOR'
UNION ALL SELECT 'Oman', 'OM', 'OMN'
UNION ALL SELECT 'Pakistan', 'PK', 'PAK'
UNION ALL SELECT 'Palau', 'PW', 'PLW'
UNION ALL SELECT 'Palestinian Territory, Occupied', 'PS', 'PSE'
UNION ALL SELECT 'Panama', 'PA', 'PAN'
UNION ALL SELECT 'Papua New Guinea', 'PG', 'PNG'
UNION ALL SELECT 'Paraguay', 'PY', 'PRY'
UNION ALL SELECT 'Peru', 'PE', 'PER'
UNION ALL SELECT 'Philippines', 'PH', 'PHL'
UNION ALL SELECT 'Pitcairn', 'PN', 'PCN'
UNION ALL SELECT 'Poland', 'PL', 'POL'
UNION ALL SELECT 'Portugal', 'PT', 'PRT'
UNION ALL SELECT 'Puerto Rico', 'PR', 'PRI'
UNION ALL SELECT 'Qatar', 'QA', 'QAT'
UNION ALL SELECT 'Reunion', 'RE', 'REU'
UNION ALL SELECT 'Romania', 'RO', 'ROU'
UNION ALL SELECT 'Russian Federation', 'RU', 'RUS'
UNION ALL SELECT 'Rwanda', 'RW', 'RWA'
UNION ALL SELECT 'Saint-Barthelemy', 'BL', 'BLM'
UNION ALL SELECT 'Saint Helena', 'SH', 'SHN'
UNION ALL SELECT 'Saint Kitts and Nevis', 'KN', 'KNA'
UNION ALL SELECT 'Saint Lucia', 'LC', 'LCA'
UNION ALL SELECT 'Saint-Martin (French part)', 'MF', 'MAF'
UNION ALL SELECT 'Saint Pierre and Miquelon', 'PM', 'SPM'
UNION ALL SELECT 'Saint Vincent and Grenadines', 'VC', 'VCT'
UNION ALL SELECT 'Samoa', 'WS', 'WSM'
UNION ALL SELECT 'San Marino', 'SM', 'SMR'
UNION ALL SELECT 'Sao Tome and Principe', 'ST', 'STP'
UNION ALL SELECT 'Saudi Arabia', 'SA', 'SAU'
UNION ALL SELECT 'Senegal', 'SN', 'SEN'
UNION ALL SELECT 'Serbia', 'RS', 'SRB'
UNION ALL SELECT 'Seychelles', 'SC', 'SYC'
UNION ALL SELECT 'Sierra Leone', 'SL', 'SLE'
UNION ALL SELECT 'Singapore', 'SG', 'SGP'
UNION ALL SELECT 'Slovakia', 'SK', 'SVK'
UNION ALL SELECT 'Slovenia', 'SI', 'SVN'
UNION ALL SELECT 'Solomon Islands', 'SB', 'SLB'
UNION ALL SELECT 'Somalia', 'SO', 'SOM'
UNION ALL SELECT 'South Africa', 'ZA', 'ZAF'
UNION ALL SELECT 'South Georgia and the South Sandwich Islands', 'GS', 'SGS'
UNION ALL SELECT 'South Sudan', 'SS', 'SSD'
UNION ALL SELECT 'Spain', 'ES', 'ESP'
UNION ALL SELECT 'Sri Lanka', 'LK', 'LKA'
UNION ALL SELECT 'Sudan', 'SD', 'SDN'
UNION ALL SELECT 'Suriname', 'SR', 'SUR'
UNION ALL SELECT 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM'
UNION ALL SELECT 'Swaziland', 'SZ', 'SWZ'
UNION ALL SELECT 'Sweden', 'SE', 'SWE'
UNION ALL SELECT 'Switzerland', 'CH', 'CHE'
UNION ALL SELECT 'Syrian Arab Republic (Syria)', 'SY', 'SYR'
UNION ALL SELECT 'Taiwan, Republic of China', 'TW', 'TWN'
UNION ALL SELECT 'Tajikistan', 'TJ', 'TJK'
UNION ALL SELECT 'Tanzania, United Republic of', 'TZ', 'TZA'
UNION ALL SELECT 'Thailand', 'TH', 'THA'
UNION ALL SELECT 'Timor-Leste', 'TL', 'TLS'
UNION ALL SELECT 'Togo', 'TG', 'TGO'
UNION ALL SELECT 'Tokelau', 'TK', 'TKL'
UNION ALL SELECT 'Tonga', 'TO', 'TON'
UNION ALL SELECT 'Trinidad and Tobago', 'TT', 'TTO'
UNION ALL SELECT 'Tunisia', 'TN', 'TUN'
UNION ALL SELECT 'Turkey', 'TR', 'TUR'
UNION ALL SELECT 'Turkmenistan', 'TM', 'TKM'
UNION ALL SELECT 'Turks and Caicos Islands', 'TC', 'TCA'
UNION ALL SELECT 'Tuvalu', 'TV', 'TUV'
UNION ALL SELECT 'Uganda', 'UG', 'UGA'
UNION ALL SELECT 'Ukraine', 'UA', 'UKR'
UNION ALL SELECT 'United Arab Emirates', 'AE', 'ARE'
UNION ALL SELECT 'United Kingdom', 'GB', 'GBR'
UNION ALL SELECT 'United States of America', 'US', 'USA'
UNION ALL SELECT 'Uruguay', 'UY', 'URY'
UNION ALL SELECT 'Uzbekistan', 'UZ', 'UZB'
UNION ALL SELECT 'Vanuatu', 'VU', 'VUT'
UNION ALL SELECT 'Venezuela (Bolivarian Republic)', 'VE', 'VEN'
UNION ALL SELECT 'Viet Nam', 'VN', 'VNM'
UNION ALL SELECT 'Virgin Islands, US', 'VI', 'VIR'
UNION ALL SELECT 'Wallis and Futuna Islands', 'WF', 'WLF'
UNION ALL SELECT 'Western Sahara', 'EH', 'ESH'
UNION ALL SELECT 'Yemen', 'YE', 'YEM'
UNION ALL SELECT 'Zambia', 'ZM', 'ZMB'
UNION ALL SELECT 'Zimbabwe', 'ZW', 'ZWE'
),

-- Distinct raw values only — this is what keeps every join below cheap
distinct_countries AS (
SELECT DISTINCT pat_country
FROM biogen_consolidated.patient_demographics
),

normalized AS (
SELECT
d.pat_country,
TRIM(d.pat_country) AS pat_country_trim,
LOWER(TRIM(d.pat_country)) AS pat_country_lower
FROM distinct_countries d
),

by_name AS (
SELECT n.pat_country, r.country_name AS matched
FROM normalized n
JOIN country_ref r ON n.pat_country_lower = LOWER(r.country_name)
),

by_alpha2 AS (
SELECT n.pat_country, r.country_name AS matched
FROM normalized n
JOIN country_ref r
ON LENGTH(n.pat_country_trim) = 2
AND n.pat_country_lower = LOWER(r.alpha2)
),

by_alpha3 AS (
SELECT n.pat_country, r.country_name AS matched
FROM normalized n
JOIN country_ref r
ON LENGTH(n.pat_country_trim) = 3
AND n.pat_country_lower = LOWER(r.alpha3)
),

aliased AS (
SELECT n.pat_country,
CASE
WHEN n.pat_country_lower IN ('united states', 'usa', 'america') THEN 'United States of America'
WHEN n.pat_country_lower IN ('uk', 'britain', 'great britain', 'england') THEN 'United Kingdom'
ELSE NULL
END AS matched
FROM normalized n
),

-- One row per distinct raw pat_country value -> its standardized name
country_map AS (
SELECT
n.pat_country,
CASE
WHEN n.pat_country IS NULL OR n.pat_country_trim = '' THEN 'Unknown'
WHEN n.pat_country_lower IN ('unknown','undetermined','undefined') THEN 'Unknown'
WHEN n.pat_country_lower IN ('patient declined','declined to specify') THEN 'Declined to specify'
WHEN bn.matched IS NOT NULL THEN bn.matched
WHEN al.matched IS NOT NULL THEN al.matched
WHEN b2.matched IS NOT NULL THEN b2.matched
WHEN b3.matched IS NOT NULL THEN b3.matched
ELSE 'NS'
END AS pat_country_std
FROM normalized n
LEFT JOIN by_name  bn ON n.pat_country = bn.pat_country
LEFT JOIN aliased  al ON n.pat_country = al.pat_country
LEFT JOIN by_alpha2 b2 ON n.pat_country = b2.pat_country
LEFT JOIN by_alpha3 b3 ON n.pat_country = b3.pat_country
)
select distinct pat_country, pat_country_std from country_map ;










































































































































































































































































































































































































































































































































































































































































































