---
name: xiaohongshu-analyzer
description: Analyze Xiaohongshu (Little Red Book) posts to extract content, summarize key points, and analyze viral mechanics. Use this skill when users provide Xiaohongshu post links or content and request analysis, summary, viral logic breakdown, content structure analysis, or want to understand what makes a post successful. Key triggers include Chinese terms (小红书, 笔记分析, 爆款分析, 文案分析, 分析链接), English terms (xiaohongshu, little red book, viral analysis), and post URLs containing xiaohongshu.com.
---

# Xiaohongshu Analyzer

## Overview

Extract and analyze Xiaohongshu (Little Red Book) post content to understand viral mechanics, summarize key points, and provide actionable insights for content creation.

## Workflow

### 1. Extract Content

If user provides a Xiaohongshu URL:
- Use webReader tool to fetch the post content
- Extract: title, body text, tags, author info, engagement data (likes, comments, saves)
- Note if images are available for visual analysis

If user provides raw text directly:
- Proceed to analysis step

### 2. Analyze Structure

Load [analysis_framework.md](references/analysis_framework.md) and evaluate:

**Title Analysis**
- Identify type: question/number/emotion/practical/contrast
- Note keyword density, character length, attraction elements (emoji, numbers, punctuation)

**Opening Hook**
- Classify hook type: pain point/interest承诺/contrast/suspense
- Assess first-3-second capture effectiveness

**Body Structure**
- Identify structure type: problem-solution/experience sharing/tutorial/viewpoint
- Calculate information density (characters per key point)
- Analyze logic flow and visual formatting

**Ending & CTA**
- Note action calls (save/like/follow/comment)
- Identify emotional resonance or interaction design

**Tags**
- Evaluate tag relevance and optimization

### 3. Decode Viral Mechanics

Use [analysis_framework.md](references/analysis_framework.md) to analyze:

**Emotional Value Dimensions**
- Rate on 5-star scale: anxiety relief, positive anticipation, identity resonance, curiosity, social currency

**Pain Point Resonance**
- Identify pain point level (surface/deep/soul-level)
- Note resonance triggers used
- Evaluate solution practicality

**Transmission Mechanism**
- Analyze interaction incentives (comment/save/share triggers)
- Extract shareable quotes ("gold sentences")
- Identify discussion-sparking elements

**Trust Signals**
- Note authority backing, authenticity markers, social proof

### 4. Identify Copywriting Techniques

From [viral_patterns.md](references/viral_patterns.md):

**Language Style**
- Assess colloquialism, internet slang, unique expressions

**Rhetorical Devices**
- Identify metaphors, parallelism, rhetorical questions, hyperbole, contrasts

**Number Usage**
- Classify number types and evaluate credibility

### 5. Generate Analysis Report

Use [report_template.md](references/report_template.md) format:

**Report Sections:**
1. **原始文案提取** - Original content extraction
2. **内容结构分析** - Structure breakdown (title, opening, body, ending, tags)
3. **爆款逻辑拆解** - Viral mechanics (emotional value, pain points, transmission, trust)
4. **文案技巧识别** - Copywriting techniques (style, rhetoric, numbers)
5. **目标人群画像** - Target audience profile
6. **重点提炼** - Key insights (core viewpoint, viral elements, learnable techniques)
7. **改写建议** - Rewrite suggestions (what to keep, replace, optimize)
8. **可复制性评估** - Replicability assessment with ratings
9. **选题延展建议** - Topic expansion ideas (horizontal, vertical, crossover)

### 6. Handle Variations

**For brief summary requests:**
- Provide condensed 3-paragraph output: content overview, viral logic, key takeaways

**For specific focus requests:**
- If user asks specifically about viral logic, skip to Section 3
- If user wants rewrite suggestions, emphasize Section 7
- If user wants audience analysis, emphasize Section 5

**For batch analysis:**
- Process multiple links sequentially
- Provide comparative summary across posts

## Key References

- [analysis_framework.md](references/analysis_framework.md) - Comprehensive analysis framework with all evaluation criteria
- [viral_patterns.md](references/viral_patterns.md) - Common viral patterns and templates
- [report_template.md](references/report_template.md) - Standardized report structure

## Notes

- Xiaohongshu content often uses emojis and special formatting - preserve these in extraction
- Visual elements (images) are critical to the platform - analyze if available
- Platform trends evolve quickly - prioritize patterns from [viral_patterns.md](references/viral_patterns.md) while adapting to current context
- Focus on actionable insights the user can apply to their own content
