# Portfolio v342 – Move Webflow-hosted images to local files

This package starts with the complete v340 website (HTML, local images, logos, videos, CV and other assets). It also contains a migration utility that downloads the remaining **65 distinct Webflow CDN files**, copies them to `assets/webflow/`, and rewrites all affected HTML links to local files.

**Important:** The ZIP as provided is not fully independent of Webflow until you run the download utility successfully. Do **not** cancel or delete your Webflow site until the migration completes and you have verified the new Cloudflare Pages deployment.

## How to finish on a Mac

1. Unzip `portfolio-dashboard-single-site-v342-localisation-kit.zip`.
2. Make sure your Mac has Internet access.
3. Double-click **`Localise_Webflow_Assets.command`** in the extracted folder. If macOS blocks opening it, open Terminal, `cd` to the extracted folder and run:
   ```bash
   python3 tools/localise_webflow_assets.py
   ```
4. The script downloads all 65 files, verifies their file formats, updates `index.html` and `case-study-template.html`, and checks that no Webflow CDN references remain in HTML. Failed downloads are reported and **do not trigger changes to your website HTML**. You can run the script again to retry.
5. After success, find **`portfolio-dashboard-single-site-v342-local-complete.zip`** beside the extracted folder. **Use this new ZIP** (extract its contents) for your GitHub repo / Cloudflare Pages staging deployment.

## What it changes

- `assets/webflow/`: downloaded PNG, JPG, GIF and WebP files
- `index.html`, `case-study-template.html`: original CDN links changed to `assets/webflow/...` only after every file is downloaded
- `migration/webflow-download-report.json`: download status and file hashes
- `portfolio-dashboard-single-site-v342-local-complete.zip`: deployable archive created only on success

It does **not** replace unrelated external links (LinkedIn, HCL product websites, external map embed) or change case-study text, layout, themes, or visuals.

## Final launch checklist

- Verify every case study and the light/dark/Light side/Dark side variants on your staging URL.
- Check GIF animations, videos, custom photos, links and CV downloads.
- Confirm all image requests are served from your Cloudflare Pages domain (browser DevTools > Network), not `cdn.prod.website-files.com`.
- Update your own domain's DNS, confirm the Cloudflare version loads, and only then cancel Webflow hosting. Keep the Webflow project backup if you want.

**If the script reports any failed files:** the CDN may no longer serve them. In that case, retrieve the originals from a Webflow export/asset library (or another backed-up copy) before continuing. The failed URLs are listed in the report.


## v342 design update

Replaced the Overview employer-tenure bar chart with an interactive five-stage End-to-end UX widget (Discover → Define → Design → Validate → Deliver). All five stages are equally represented. Hover, focus or select a stage to view a concise description. The rest of the site is retained from v341.
