# Dataset: Fabrizio Corona TikTok Videos — January 2026

## Overview

This dataset contains metadata for TikTok videos related to **Fabrizio Corona** posted by users in Italy during January 2026. The data was collected via the TikTok Research API for academic research purposes.

## File Information

| Attribute | Value |
|-----------|-------|
| Filename | `fabrizio_corona_tiktok_jan2026.csv` |
| Format | CSV (comma-separated values), UTF-8 encoded |
| Rows | 9,373 videos |
| Unique authors | 4,964 |
| Total views | 338,738,386 |
| Total likes | 15,724,368 |
| Date range | January 1-31, 2026 |
| Region | Italy (IT) |
| Collection date | February 4, 2026 |

## Data Dictionary

| Variable | Type | Description |
|----------|------|-------------|
| `video_id` | string | Unique TikTok video identifier |
| `create_time` | integer | Unix timestamp of video creation |
| `create_datetime` | datetime | Human-readable UTC datetime (YYYY-MM-DD HH:MM:SS) |
| `create_date` | date | Date only (YYYY-MM-DD) |
| `description` | string | Video description/caption text |
| `hashtags` | string | Comma-separated list of hashtags used |
| `duration` | integer | Video duration in seconds |
| `view_count` | integer | Number of views at time of collection |
| `like_count` | integer | Number of likes at time of collection |
| `comment_count` | integer | Number of comments at time of collection |
| `share_count` | integer | Number of shares at time of collection |
| `author_name` | string | TikTok username of video creator |
| `music_id` | string | ID of the audio track used |
| `region_code` | string | Two-letter country code (IT for all rows) |

## Search Criteria

The data was collected using two queries:

1. **Keyword search**: Videos containing "Fabrizio Corona" in the description
2. **Hashtag search**: Videos tagged with `#fabriziocorona`

Both filtered by:
- Region: Italy (IT)
- Date range: January 1-31, 2026

Duplicate videos (matching both criteria) were removed.

## Context

Fabrizio Corona is a controversial Italian media personality, former paparazzo, and entrepreneur known for his frequent appearances in tabloid news. This dataset allows analysis of:

- How public figures are discussed on social media
- Engagement patterns around celebrity content
- Creator ecosystem dynamics
- Temporal patterns in social media attention

## Limitations

1. **Region filter**: The `region_code` reflects where creators registered their accounts, not necessarily where videos were posted or viewed.

2. **Point-in-time snapshot**: Engagement metrics (views, likes, comments, shares) reflect values at collection time and may have changed since.

3. **API coverage**: The TikTok Research API may not return all matching videos. Some content types are excluded.

4. **Music metadata**: Only `music_id` is available; music titles require a separate API lookup.

## Citation

If using this dataset, please cite:

> TikTok Research API. (2026). TikTok for Developers. https://developers.tiktok.com/products/research-api/

## License

This dataset is intended for academic research purposes only, in accordance with TikTok Research API Terms of Service.
