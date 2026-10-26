from setuptools import setup, find_packages

setup(
    name='apiverve_linkscraper',
    version='1.2.3',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Link Scraper is a website link extractor API that pulls internal and external links from any webpage URL in real time. It resolves relative paths to absolute URLs, strips empty fragments, and returns anchor text with internal and external counts.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/linkscraper?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
