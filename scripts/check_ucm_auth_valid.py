#!/usr/bin/env python3

import datetime as dt
import json
import sys


def is_valid(credentials_path: str, skew_seconds: int) -> bool:
    with open(credentials_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    active_profile = data.get("active_profile")
    profile_credentials = (data.get("credentials") or {}).get(active_profile)
    if not isinstance(profile_credentials, dict) or not profile_credentials:
        return False

    # credentials are keyed by host; use whichever host entry is active.
    host_credentials = next(iter(profile_credentials.values()))
    fetch_time = host_credentials.get("fetch_time")
    expires_in = (host_credentials.get("tokens") or {}).get("expires_in")
    if not fetch_time or not isinstance(expires_in, (int, float)):
        return False

    fetch_trimmed = fetch_time.split(".", 1)[0]
    if fetch_trimmed.endswith("Z"):
        fetch_trimmed = fetch_trimmed[:-1]

    fetched_at = dt.datetime.strptime(fetch_trimmed, "%Y-%m-%dT%H:%M:%S").replace(
        tzinfo=dt.timezone.utc
    )
    expires_at = fetched_at.timestamp() + int(expires_in) - int(skew_seconds)
    now = dt.datetime.now(dt.timezone.utc).timestamp()
    return now < expires_at


def main() -> int:
    if len(sys.argv) < 2:
        return 2

    credentials_path = sys.argv[1]
    skew_seconds = int(sys.argv[2]) if len(sys.argv) > 2 else 60

    try:
        return 0 if is_valid(credentials_path, skew_seconds) else 1
    except Exception:
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
