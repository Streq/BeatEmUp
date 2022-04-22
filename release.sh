#!/bin/bash
./sh/require_clean_work_tree.sh || exit "$?"
./sh/export.sh || exit "$?"
./sh/increment_version.sh "$@"
./sh/export_to_gh_pages.sh