part of imgur.common;

/// The Imgur basic sort methods.
enum Sort { time, top }

/// Another instance of [Sort] with [viral] option.
enum ViralSort { time, viral, top }

/// Another instance of [Sort] with [best] option.
enum BestSort { time, best, top }

/// A sort with only [oldest] and [newest] options.
enum FavoriteSort { oldest, newest }

/// An enum used for sorting comments.
enum DateBestSort { best, worst, oldest, newest }

/// An enum representing Imgur Privacy options.
enum Privacy { public, hidden, secret }

/// A window represents the data range of a request.
enum Window { day, week, month, year, all }

enum Section { hot, top, user }

/// An enumeration representing the Imgur query options described in
/// the documentation.
///
/// [q]	        Query string
/// [q_all]	    Search for all of these words (and)
/// [q_any]	    Search for any of these words (or)
/// [q_exactly] Search for exactly this word or phrase
/// [q_not]	    Exclude results matching this
/// [q_type]	  Show results for any file type, jpg | png | gif |
///             anigif (animated gif) | album
/// [q_size_px]	Size ranges:
///             small (500 pixels square or less)
///             med (500 to 2,000 pixels square)
///             big (2,000 to 5,000 pixels square)
///             lrg (5,000 to 10,000 pixels square)
///             huge (10,000 square pixels and above)
enum Query { q, q_all, q_any, q_exactly, q_not, q_type, q_size_px }

/// An enum which represents an Imgur vote.
enum VoteType { up, down, veto }

/// An helper type to represent different HTTP methods.
enum HttpMethod { GET, POST, PUT, DELETE }

/// A helper function that returns the name of an enum without the name of the
/// class in front of it.
///
/// Sort.time.toString() => 'Sort.time'
/// fmtType(Sort.time) => 'time'
String fmtType(Object type) => type.toString().split('.').last;
